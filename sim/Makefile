#env set
XRUN_TCL_PATH	:=	../run.tcl		## xrun tcl patch
LD_LIBRARY_PATH := 	/home/guyukun/Desktop/guyukun/software/verdi2018/verdi/Verdi_O-2018.09-SP2/share/PLI/VCS/linux64


# Test Bench Set
BENCH_DIR = ./bench
testcase:=ahb_usb_tb

SIM	= vcs## default sim

proj_path				:=/home/guyukun/Desktop/guyukun/USB
tb_path 				:= 	$(proj_path)/tb/bench
model_path      :=  $(proj_path)/tb/vmodel
tc_path 				:= 	$(proj_path)/tc
rtl_path1 			:= 	$(proj_path)/rtl
rtl_path2 			:= 	$(proj_path)/rtl/usb_device_core
rtl_path3 			:= 	$(proj_path)/rtl/usb_fs_utmi_phy
sim_path 				:= 	$(proj_path)/sim
filelist_path 	:= 	$(proj_path)/sim/filelist_top_sim.v		



OPTION_XRUN	:= 	-64bit -sv -notimingcheck \
				-access +rwc -accessreg +rwc \
				-debug -uvmlinedebug -classlinedebug -plidebug -fsmdebug -uvmaccess -date -dumpstack -negdelay \
				-timescale 1ns/100ps -lwdgen \
				-f $(filelist_path) \
				-input $(XRUN_TCL_PATH) -l xrun.log 

OPTION_VCS 	:= 	-f $(filelist_path)	\
				-timescale=1ns/1ps	\
				+incdir+$(rtl_path1) +incdir+$(rtl_path2) +incdir+$(rtl_path3) +incdir+$(tb_path) +incdir+$(model_path) +incdir+$(tc_path)\
				+define+TEST_CASE=\"${testName}.v\" +DUMP\
				-debug_access -R -full64 +vc +v2k -sverilog -debug_acc+all	\
				-debug_region+cell+encrypt	\
				-P ${LD_LIBRARY_PATH}/novas.tab  ${LD_LIBRARY_PATH}/pli.a | tee  ${testName}.log &

OPTION_Verdi := -f $(filelist_path) -ssf *.fsdb &


################
sim	:
	@echo "Welcome!"
ifeq ($(SIM),xrun)
	@echo "SIM is $(SIM) and dubug support indago"	
	@cd ./xrun && rm -rf *
	@cd ./xrun && xrun $(OPTION_XRUN)
else
     ifeq ($(SIM),vcs)
	@echo "SIM is $(SIM) and dubug support verdi"
	@echo "Current directory: $(shell pwd)"
	@cd ./vcs && rm -rf *
	@cd ./vcs && vcs $(OPTION_VCS)
     else
	@echo "SIM is $(SIM) and it not support now"
     endif
endif


indago	:
	@echo "Debug is indago"
	@cd ./xrun && indago
	@echo "Welcom indago !"

verdi	:
	@echo "Debug is verdi"
	@cd ./vcs && verdi $(OPTION_Verdi)
	@echo "Welcom verdi !"

app	:
	@echo "demo is design by yian"
	@cd ./xrun && verisium

debug	:
	@echo "demo is design by yian"
	@cd ./xrun && verisium_debug


cleanvcs	:
	@echo "all files in vcs folder are cleaned "
	@cd ./vcs && rm -rf *

cleanxrun	:
	@echo "all files in xrun folde are cleaned"
	@cd ./xrun && rm -rf *

help	:
	@echo "Welcome"
	@echo "commoand:"
	@echo "make vcs/make verdi /make xrun/make indago/make cleanvcs/make cleanxrun"
	@echo "this template support vcs and xrun and default sim is xrun"
	@echo "this template support verdi and indgo to debug"
	@echo "you can use 'make sim SIM=vcs'to sim your project,and use 'make verdi' to debug"
	@echo "you can use 'make xrun' to sim,and use 'make indago' to debug"
	@echo "any question,you can email me by 2577802337@qq.com about this VM"
			
