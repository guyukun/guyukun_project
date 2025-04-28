#!/usr/bin/env tclsh
#######################################################################
# File     : dc_synth.tcl
# Author   : [Your Name / Company]
# Purpose  : DC synthesis script (single corner, can switch corners)
# Usage    : dc_shell -f dc_synth.tcl | tee synthesis.log
#######################################################################

############################
# 1. 设置设计及环境变量
############################

# 设计名称（顶层模块名）
set design_name "fft8"

# 文件列表（这里是一个含有所有 .v 文件路径的 txt 文件）
set filelist "./filelist.f"

# 指定三个corner，对应库文件（此处仅示例名称，需要自行替换为实际工艺库文件）
# 可以根据需要替换或增加更多库，如 I/O 库、记忆体宏库等
set LIB_TT  "/path/to/typical_condition.lib"
set LIB_SS  "/path/to/slow_condition.lib"
set LIB_FF  "/path/to/fast_condition.lib"

# 设置当前需要使用的 corner
# possible values: TT, SS, FF
set current_corner "TT"

# 设置工艺库对应的操作条件名称（通常在 .lib 中定义，如: "typical_1.2V_25C"）
# 注意：下面这些 operation condition 名称需要和实际库文件中的定义相匹配
set op_cond_map {
    {"TT" "typical_1.2V_25C"}
    {"SS" "slow_1.08V_125C"}
    {"FF" "fast_1.32V_-40C"}
}

# 设置目标时钟周期或频率
# 例如目标频率 500MHz => 周期 = 2ns
# 请根据真实项目需求修改
set target_frequency 500e6
set target_period    [expr {1.0 / $target_frequency}] ; # = 2ns for 500MHz

# 设置工作目录（放置中间文件、log、report等）
# 可以根据需要对脚本进行mkdir等操作
set work_dir "./work"

# 如果需要更灵活，可以通过命令行传参：
#   dc_shell -f dc_synth.tcl -x "set work_dir ./my_work_dir"
# 并在脚本中进行 parse。

############################
# 2. 基础环境与库设置
############################

# 切换到工作目录
if {![file isdirectory $work_dir]} {
    file mkdir $work_dir
}
cd $work_dir

# 新建一个 DC 数据库目录，如果存在则清理
if { [file isdirectory "RUN"] } {
    file delete -force RUN
}
file mkdir RUN
set_app_var work_dir "./RUN"

# 获取操作条件名称(OCV)与库文件的映射
set operating_condition_name ""
foreach corner_pair $op_cond_map {
    set corner_code [lindex $corner_pair 0]
    set corner_name [lindex $corner_pair 1]
    if { $corner_code eq $current_corner } {
        set operating_condition_name $corner_name
        break
    }
}

if { $operating_condition_name eq "" } {
    error "Error: current_corner($current_corner) not found in op_cond_map."
}

# 读入库文件
if { $current_corner eq "TT" } {
    read_file { $LIB_TT }
} elseif { $current_corner eq "SS" } {
    read_file { $LIB_SS }
} elseif { $current_corner eq "FF" } {
    read_file { $LIB_FF }
}

# 设置目标库和链接库
set target_library [list $LIB_TT]  ; # 一般情况下习惯用 TT 库做目标库
set link_library   [list "* $LIB_TT" "*"]

# 如果需要区分corner，也可将 target_library 设置成当前 corner 的库
# set target_library [list $LIB_$current_corner]
# set link_library [list "* $LIB_$current_corner" "*"]

set_attribute library $operating_condition_name operating_conditions $target_library
set_attribute library $operating_condition_name operating_conditions $link_library

# 设置目标库、链接库
set_target_library $target_library
set_link_library   $link_library

# Enable multi-Vt 库时，可在此处读入其他VT库，如 HVT、LVT 等

############################
# 3. 读入设计文件
############################

# 读 filelist 中的 Verilog 文件
if { ![file exists $filelist] } {
    error "Filelist $filelist does not exist!"
}
set fp [open $filelist r]
while { [gets $fp line] != -1 } {
    # 跳过空行和注释行
    if {[string match "#*" $line] || $line eq ""} {
        continue
    }
    # line 中包含相对/绝对路径，可以直接 read_file
    read_file $line
}
close $fp

# 设置当前设计并进行链接
current_design $design_name
link

############################
# 4. 时序/功耗约束
############################

# 设置时钟：假设顶层有一个时钟信号 clk
create_clock -name clk -period $target_period [get_ports clk]

# 输入端口约束（假设外部驱动能力和延迟）
# 举例：输入端口到 FPGA/ASIC Pad 有额外延迟
# set_input_delay 1.0 [get_ports {in_data}]

# 输出端口约束（假设后级负载或寄存器）
# set_output_delay 1.0 [get_ports {out_data}]

# 如果需要将输入端口驱动强度设为某个驱动单元，如 INV_X4，可以：
# set_driving_cell -lib_cell INV_X4 [get_ports {in_data}]

# 设置负载
# set_load 0.05 [get_ports {out_data}]

############################
# 5. 功耗分析设置
############################
# 打开功耗分析模式
set power_analysis_mode "analytical"
# 也可用 "gate_level"
# set_power_analysis_mode $power_analysis_mode

# 如果需要设置 switching activity，可以使用：
# set_switching_activity -default_toggle_rate 0.2
# 或者指定 VCD 文件等更精准的活动信息

############################
# 6. 综合与优化
############################

# 编译选项可根据需求进行微调
compile_ultra -timing_high_effort_script \
              -area_high_effort_script \
              -power_high_effort_script

# 如果只想做快速综合，可以去掉 -high_effort_script 选项

############################
# 7. 结果检查与报告
############################

# 进行设计检查
check_design

# 报告时序裕量
report_timing -max_paths 5
report_timing -delay_type min -max_paths 5

# 报告面积
report_area

# 报告功耗
report_power

############################
# 8. 保存综合结果
############################

# 保存最终 netlist
write -format ddc -output ${design_name}_${current_corner}.ddc
write -format verilog -output ${design_name}_${current_corner}.v

# 保存约束
write_sdc ${design_name}_${current_corner}.sdc

# 保存最终综合日志
report_timing > ${design_name}_${current_corner}_timing.rpt
report_power  > ${design_name}_${current_corner}_power.rpt
report_area   > ${design_name}_${current_corner}_area.rpt

# 如果需要脚本结束后留在交互式模式，可以启用：
# dc_shell> source dc_synth.tcl
# dc_shell> ...
# 这里不建议新手在一份脚本末尾做此操作，因此注释掉。

# exit

