debImport "-f" "/home/guyukun/Desktop/guyukun/USB/sim/filelist_top_sim.v"
debLoadSimResult /home/guyukun/Desktop/guyukun/USB/sim/vcs/TEST_CASE.fsdb
wvCreateWindow
srcDeselectAll -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_W" -line 47 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state_q" -line 126 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 32934898.349978 49665405.818498
wvZoom -win $_nWave2 36676197.241107 38114599.533233
wvZoom -win $_nWave2 37009721.697894 37263300.217478
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state_r" -line 139 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN2" -line 49 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state_r" -line 139 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 170 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 170 -pos 1 -win $_nTrace1
srcAction -pos 170 1 10 -win $_nTrace1 -name "STATE_RX_SOF2" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 170 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_ready_w" -line 173 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 170 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 181 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_ready_w" -line 173 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcAction -pos 173 1 9 -win $_nTrace1 -name "next_state_r" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcAction -pos 173 5 6 -win $_nTrace1 -name "STATE_RX_SOF3" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcAction -pos 175 5 2 -win $_nTrace1 -name "STATE_RX_IDLE" -ctrlKey off
wvDrop -win $_nWave2
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 90386829.656969 -snap {("G2" 0)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 212 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcAction -pos 214 1 9 -win $_nTrace1 -name "next_state_r" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcAction -pos 214 5 9 -win $_nTrace1 -name "STATE_RX_IDLE" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcAction -pos 214 1 7 -win $_nTrace1 -name "next_state_r" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcAction -pos 214 5 5 -win $_nTrace1 -name "STATE_RX_IDLE" -ctrlKey off
wvZoom -win $_nWave2 33464164.945429 45986918.494191
wvZoom -win $_nWave2 36297217.464814 38634210.204548
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN3" -line 50 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN2" -line 49 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN3" -line 50 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN_COMPLETE" -line 51 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN3" -line 50 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_IDLE" -line 48 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN3" -line 50 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN_COMPLETE" -line 51 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_IDLE" -line 48 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN2" -line 49 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN3" -line 50 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN2" -line 49 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_IDLE" -line 48 -pos 1 -win $_nTrace1
wvZoom -win $_nWave2 36949353.643063 37131416.897875
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device" -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "ahb_usb_tb.usb_device_top.usbf_device.u_core" -delim \
           "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core" -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -win \
           $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_TX_CRC1" -line 44 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state_r" -line 50 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoom -win $_nWave2 28371300.088028 51622967.077465
wvZoom -win $_nWave2 35043873.537453 40959130.368393
wvZoom -win $_nWave2 37715111.877478 38214992.736431
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_TX_DONE" -line 46 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_TX_DATA" -line 43 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_TX_PID" -line 42 -pos 1 -win $_nTrace1
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_TX_CRC1" -line 44 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_TX_DONE" -line 46 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_last_i" -line 24 -pos 1 -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usb_fs_utmi_phy" -win $_nTrace1
srcSetScope -win $_nTrace1 "ahb_usb_tb.usb_device_top.usb_fs_utmi_phy" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usb_fs_utmi_phy" -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usb_fs_utmi_phy" -win $_nTrace1
srcSetScope -win $_nTrace1 "ahb_usb_tb.usb_device_top.usb_fs_utmi_phy" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usb_fs_utmi_phy" -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usb_fs_utmi_phy.u_usb_phy" -win $_nTrace1
srcSetScope -win $_nTrace1 "ahb_usb_tb.usb_device_top.usb_fs_utmi_phy.u_usb_phy" \
           -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usb_fs_utmi_phy.u_usb_phy" -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usb_fs_utmi_phy" -win $_nTrace1
srcSetScope -win $_nTrace1 "ahb_usb_tb.usb_device_top.usb_fs_utmi_phy" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usb_fs_utmi_phy" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {21 22 14 1 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "utmi_txvalid_i" -line 22 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "utmi_op_mode_i" -line 23 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "utmi_xcvrselect_i" -line 24 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "utmi_op_mode_i" -line 23 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 37034816.271887 -snap {("G1" 1)}
srcActiveTrace \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx.state_q\[3:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 37030000 -TraceValue \
           0001
wvSetCursor -win $_nWave2 37055057.926387 -snap {("G1" 1)}
srcActiveTrace \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx.state_q\[3:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 37050000 -TraceValue \
           0010
wvSetCursor -win $_nWave2 37058578.214126 -snap {("G1" 1)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state_r" -line 250 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rst_i" -line 245 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "enable_i" -line 247 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state_r" -line 250 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "handshake_valid_q" -line 255 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state_r" -line 250 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state_r" -line 250 -pos 1 -win $_nTrace1
srcAction -pos 249 5 8 -win $_nTrace1 -name "next_state_r" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "state_q" -line 124 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state_q" -line 124 -pos 1 -win $_nTrace1
srcAction -pos 123 5 4 -win $_nTrace1 -name "state_q" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state_r" -line 250 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state_r" -line 250 -pos 1 -win $_nTrace1
srcAction -pos 249 5 7 -win $_nTrace1 -name "next_state_r" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state_r" -line 120 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state_q" -line 124 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state_q" -line 126 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state_r" -line 142 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 143 -pos 2 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 143 -pos 6 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 143 -pos 10 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 143 -pos 14 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 143 -pos 14 -win $_nTrace1
srcAction -pos 143 20 1 -win $_nTrace1 -name "PID_MDATA" -ctrlKey off
srcSearchString "PID_MDATA:
" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {144 144 15 17 1 1}
nsMsgSwitchTab -tab general
srcSearchString "PID_MDATA:
" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {144 144 15 17 1 1}
srcSearchString "PID_MDATA:
" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {144 144 15 17 1 1}
srcSearchString "PID_MDATA:
" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {144 144 15 17 1 1}
srcSearchString "PID_MDATA:
" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -word -line 143 -pos 6 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -word -line 137 -pos 2 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_valid_i" -line 19 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_valid_i" -line 19 -pos 1 -win $_nTrace1
srcAction -pos 18 4 4 -win $_nTrace1 -name "tx_valid_i" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_valid_q" -line 672 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_valid_r" -line 672 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_valid_r" -line 672 -pos 1 -win $_nTrace1
srcAction -pos 671 5 4 -win $_nTrace1 -name "tx_valid_r" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_valid_r" -line 541 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_valid_r" -line 546 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_valid_r" -line 566 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "token_pid_w" -line 561 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ep_stall_r" -line 564 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "token_pid_w" -line 561 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {540 541 1 1 1 1}
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "pid_o" -line 24 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "frame_valid_o" -line 25 -pos 1 -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx.u_crc16" -win \
           $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -win \
           $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_ready_w" -line 133 -pos 1 -win $_nTrace1
srcAction -pos 132 4 7 -win $_nTrace1 -name "data_ready_w" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_valid_q\[0\]" -line 111 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "token_dev_q" -line 327 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "token_pid_q" -line 304 -pos 1 -win $_nTrace1
srcAction -pos 303 1 6 -win $_nTrace1 -name "token_pid_q" -ctrlKey off
srcSearchString "token_pid_q" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {306 306 2 3 1 1}
srcSearchString "token_pid_q" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {304 304 2 3 1 1}
srcSearchString "token_pid_q" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {72 72 12 13 1 1}
srcSearchString "token_pid_q" -win $_nTrace1 -next -case
schCreateWindow -delim "." -win $_nSchema1 -scope \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx"
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -inst \
          "usbf_device_core\(@1\):Always12:808:823:RegCombo"
schPushViewIn -win $_nSchema3
srcSetScope -win $_nTrace1 "ahb_usb_tb.usb_device_top.usbf_device.u_core" -delim \
           "."
srcSelect -win $_nTrace1 -range {808 823 1 2 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core" -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
verdiDockWidgetSetCurTab -dock windowDock_nSchema_3
schSelect -win $_nSchema3 -inst "usbf_device_core\(@1\):Always2:262:312:Combo"
schPushViewIn -win $_nSchema3
srcSetScope -win $_nTrace1 "ahb_usb_tb.usb_device_top.usbf_device.u_core" -delim \
           "."
srcSelect -win $_nTrace1 -range {262 312 1 2 1 1}
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core" -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
verdiDockWidgetSetCurTab -dock windowDock_nSchema_3
schSelect -win $_nSchema3 -inst "u_sie_rx"
schSelect -win $_nSchema3 -inst "u_sie_rx"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "usbf_sie_rx\(@1\):Always9:302:308:RegCombo"
schPushViewIn -win $_nSchema3
srcSelect -win $_nTrace1 -range {302 308 1 10 1 1}
srcDeselectAll -win $_nTrace1
verdiDockWidgetSetCurTab -dock windowDock_nSchema_3
schSelect -win $_nSchema3 -inst "usbf_sie_rx\(@1\):Always8:291:295:RegCombo"
schPushViewIn -win $_nSchema3
srcSelect -win $_nTrace1 -range {291 295 1 18 1 1}
srcDeselectAll -win $_nTrace1
srcBackwardHistory -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
verdiDockWidgetSetCurTab -dock windowDock_nSchema_3
schSelect -win $_nSchema3 -inst "usbf_sie_rx\(@1\):Always4:122:155:Combo"
schPushViewIn -win $_nSchema3
srcSelect -win $_nTrace1 -range {122 155 1 3 1 1}
verdiDockWidgetSetCurTab -dock windowDock_nSchema_3
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -inst "u_crc16"
schPushViewIn -win $_nSchema3
srcBackwardHistory -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
verdiDockWidgetSetCurTab -dock windowDock_nSchema_3
schPopViewUp -win $_nSchema3
schDeselectAll -win $_nSchema3
schPopViewUp -win $_nSchema3
schSetOptions -win $_nSchema3 -pinName on
schZoom {-4188} {35108} {19282} {60423} -win $_nSchema3
schZoom {-5483} {42276} {5914} {59211} -win $_nSchema3
schZoomOut -win $_nSchema3 -pos 857 47525
schZoomOut -win $_nSchema3 -pos 856 47554
schZoomOut -win $_nSchema3 -pos 855 47554
schZoomOut -win $_nSchema3 -pos 855 47554
schZoomOut -win $_nSchema3 -pos 450 48018
schZoomOut -win $_nSchema3 -pos 159 48816
schZoomOut -win $_nSchema3 -pos 160 48815
schZoomOut -win $_nSchema3 -pos 160 48815
schZoomOut -win $_nSchema3 -pos 159 48815
schZoomOut -win $_nSchema3 -pos 159 48815
schZoomOut -win $_nSchema3 -pos 158 48815
schZoom {143920} {18127} {195342} {73143} -win $_nSchema3
schZoom {142933} {14656} {176190} {65195} -win $_nSchema3
schZoom {151977} {32022} {167004} {50805} -win $_nSchema3
schZoom {152799} {36922} {160939} {44271} -win $_nSchema3
schZoomOut -win $_nSchema3 -pos 157487 38932
schZoomOut -win $_nSchema3 -pos 157487 38932
schZoomOut -win $_nSchema3 -pos 157487 38932
schZoomOut -win $_nSchema3 -pos 157487 38931
schZoomOut -win $_nSchema3 -pos 157486 38930
schZoomOut -win $_nSchema3 -pos 157674 38553
schZoomOut -win $_nSchema3 -pos 157674 38553
schZoom {152023} {-7740} {161162} {416} -win $_nSchema3
schZoomOut -win $_nSchema3 -pos 158364 -3976
schZoomOut -win $_nSchema3 -pos 158364 -3976
schZoomOut -win $_nSchema3 -pos 158363 -3977
schZoomIn -win $_nSchema3 -pos 158363 -3978
schZoomIn -win $_nSchema3 -pos 158363 -3979
schZoomIn -win $_nSchema3 -pos 158363 -3979
schZoomIn -win $_nSchema3 -pos 158363 -3979
schZoomOut -win $_nSchema3 -pos 158363 -3980
schZoomOut -win $_nSchema3 -pos 158362 -3980
schZoomOut -win $_nSchema3 -pos 158362 -3980
schZoomOut -win $_nSchema3 -pos 158362 -3979
schZoomOut -win $_nSchema3 -pos 158361 -3980
schZoomOut -win $_nSchema3 -pos 158361 -3980
schZoomOut -win $_nSchema3 -pos 158360 -3981
schZoomOut -win $_nSchema3 -pos 158057 -3744
schZoomOut -win $_nSchema3 -pos 158056 -3745
schZoomOut -win $_nSchema3 -pos 158056 -3745
schZoomOut -win $_nSchema3 -pos 158056 -3745
schZoomOut -win $_nSchema3 -pos 158056 -3746
schZoomOut -win $_nSchema3 -pos 158055 -3746
schZoomOut -win $_nSchema3 -pos 158055 -3361
schZoomOut -win $_nSchema3 -pos 158054 -3361
schZoomOut -win $_nSchema3 -pos 158054 -3360
schZoomOut -win $_nSchema3 -pos 158053 -3361
schZoomIn -win $_nSchema3 -pos 158053 -3361
schZoomIn -win $_nSchema3 -pos 158053 -3361
schZoomIn -win $_nSchema3 -pos 158053 -3361
schZoomOut -win $_nSchema3 -pos 158052 -3361
schZoomOut -win $_nSchema3 -pos 158052 -3361
schDeselectAll -win $_nSchema3
verdiWindowResize -win $_Verdi_1 "830" "343" "900" "700"
verdiWindowResize -win $_Verdi_1 "1001" "35" "900" "700"
verdiWindowResize -win $_Verdi_1 "1767" "363" "900" "700"
verdiDockWidgetSetCurTab -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_last_o" -line 437 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_o" -line 436 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_q" -line 436 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_o" -line 436 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_q" -line 436 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_q" -line 428 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "input_data_w" -line 428 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_o" -line 436 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_o" -line 436 -pos 1 -win $_nTrace1
srcAction -pos 435 2 3 -win $_nTrace1 -name "data_o" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_o" -line 436 -pos 1 -win $_nTrace1
srcAction -pos 435 2 3 -win $_nTrace1 -name "data_o" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_o" -line 436 -pos 1 -win $_nTrace1
srcAction -pos 435 2 3 -win $_nTrace1 -name "data_o" -ctrlKey off
srcSearchString "data_o" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {436 436 3 4 1 1}
srcSearchString "data_o" -win $_nTrace1 -prev -case
srcSelect -win $_nTrace1 -range {34 34 12 13 1 1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state_r" -line 120 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state_q" -line 124 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_IDLE" -line 48 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN2" -line 49 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN3" -line 50 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_TOKEN_COMPLETE" -line 51 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_DATA" -line 54 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_DATA_COMPLETE" -line 55 -pos 1 -win $_nTrace1
wvSetCursor -win $_nWave2 43836858.406690 -snap {("G2" 0)}
wvZoom -win $_nWave2 28797936.179577 44903448.635563
wvSetCursor -win $_nWave2 29875417.646696 -snap {("G2" 0)}
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_tx" -win \
           $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx.u_crc16" -win \
           $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx.u_crc16" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx.u_crc16" \
           -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx.u_crc16" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "crc_in_i" -line 14 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "din_i" -line 15 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "crc_in_i" -line 14 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "crc_out_o" -line 18 -pos 1 -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core" -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core" -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core" -win $_nTrace1
srcSetScope -win $_nTrace1 "ahb_usb_tb.usb_device_top.usbf_device.u_core" -delim \
           "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_TX_CHIRP" -line 108 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_TX_HANDSHAKE" -line 107 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_TX_DATA_COMPLETE" -line 106 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_TX_DATA" -line 105 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_DATA_IGNORE" -line 104 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_IDLE" -line 101 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_DATA" -line 102 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_DATA_READY" -line 103 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "STATE_RX_DATA_IGNORE" -line 104 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_data_valid_r" -line 218 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_data_strb_r" -line 219 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_data_r" -line 220 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_data_last_r" -line 221 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "token_ep_w" -line 223 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "token_ep_w" -line 223 -pos 1 -win $_nTrace1
srcAction -pos 222 4 6 -win $_nTrace1 -name "token_ep_w" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core.u_sie_rx" -win \
           $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_core" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "token_ep_w" -line 223 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "tx_data_accept_w" -line 257 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "token_ep_w" -line 257 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "ep0_rx_space_i" -line 275 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ep0_rx_space_i" -line 275 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ep0_tx_ready_i" -line 276 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ep0_in_data_bit_q" -line 278 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "ep0_out_data_bit_q" -line 277 -pos 1 -win $_nTrace1
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_fifo_rx_ep0" -win $_nTrace1
srcSetScope -win $_nTrace1 "ahb_usb_tb.usb_device_top.usbf_device.u_fifo_rx_ep0" \
           -delim "."
srcHBSelect "ahb_usb_tb.usb_device_top.usbf_device.u_fifo_rx_ep0" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {59 64 1 1 1 1} -backward
srcDeselectAll -win $_nTrace1
srcSelect -signal "ADDR_W" -line 62 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
