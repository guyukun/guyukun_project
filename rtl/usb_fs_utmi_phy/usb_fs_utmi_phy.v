/*==================================================================================*\
Filename: 
Author: zyh
Description: usb_fs_utmi_phy
Call by: 
Date: 2024.9.17
Revision History: 1.1
Company: 
\*==================================================================================*/

//##### Configuration / Requirements
//* Top: usb_fs_phy
//* Clock: clk_i - 48MHz
//* Reset: rst_i - Asynchronous, active high

module usb_fs_utmi_phy
(
     input           clk_i
    ,input           rst_i

    ,input  [  7:0]  utmi_data_out_i    //from sie_tx
    ,input           utmi_txvalid_i		  //from sie_tx
    ,input  [  1:0]  utmi_op_mode_i     //from usbf_dev_top
    ,input  [  1:0]  utmi_xcvrselect_i  //from usbf_dev_top
    ,input           utmi_termselect_i  
    ,input           utmi_dppulldown_i
    ,input           utmi_dmpulldown_i
    ,output [  7:0]  utmi_data_in_o
    ,output          utmi_txready_o
    ,output          utmi_rxvalid_o
    ,output          utmi_rxactive_o
    ,output          utmi_rxerror_o
    ,output [  1:0]  utmi_linestate_o

    // USB D+ / D-
    ,input           usb_dp_i
    ,input           usb_dn_i
    ,output			 usb_dpdn_oe
    ,output          usb_dp_o
    ,output          usb_dn_o
);

wire           usb_pads_rx_rcv_w;
wire           usb_pads_rx_dn_w;
wire           usb_pads_rx_dp_w;
wire           usb_pads_tx_dn_w;
wire           usb_pads_tx_dp_w;
wire           usb_pads_tx_oen_w;

usb_transceiver u_usb_xcvr
(
    // Inputs
     .usb_phy_tx_dp_i(usb_pads_tx_dp_w)
    ,.usb_phy_tx_dn_i(usb_pads_tx_dn_w)
    ,.usb_phy_tx_oen_i(usb_pads_tx_oen_w)
    ,.mode_i(1'b1)

    // Outputs
    ,.usb_dp_i(usb_dp_i)
    ,.usb_dn_i(usb_dn_i)
    ,.usb_dpdn_oe(usb_dpdn_oe)
    ,.usb_dp_o(usb_dp_o)
    ,.usb_dn_o(usb_dn_o)   
    ,.usb_phy_rx_rcv_o(usb_pads_rx_rcv_w)
    ,.usb_phy_rx_dp_o(usb_pads_rx_dp_w)
    ,.usb_phy_rx_dn_o(usb_pads_rx_dn_w)
    
);

usb_fs_phy u_usb_phy
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.utmi_data_out_i(utmi_data_out_i)
    ,.utmi_txvalid_i(utmi_txvalid_i)
    ,.utmi_op_mode_i(utmi_op_mode_i)
    ,.utmi_xcvrselect_i(utmi_xcvrselect_i)
    ,.utmi_termselect_i(utmi_termselect_i)
    ,.utmi_dppulldown_i(utmi_dppulldown_i)
    ,.utmi_dmpulldown_i(utmi_dmpulldown_i)
    ,.usb_rx_rcv_i(usb_pads_rx_rcv_w)
    ,.usb_rx_dp_i(usb_pads_rx_dp_w)
    ,.usb_rx_dn_i(usb_pads_rx_dn_w)
    ,.usb_reset_assert_i(1'b0)

    // Outputs
    ,.utmi_data_in_o(utmi_data_in_o)
    ,.utmi_txready_o(utmi_txready_o)
    ,.utmi_rxvalid_o(utmi_rxvalid_o)
    ,.utmi_rxactive_o(utmi_rxactive_o)
    ,.utmi_rxerror_o(utmi_rxerror_o)
    ,.utmi_linestate_o(utmi_linestate_o)
    ,.usb_tx_dp_o(usb_pads_tx_dp_w)
    ,.usb_tx_dn_o(usb_pads_tx_dn_w)
    ,.usb_tx_oen_o(usb_pads_tx_oen_w)
    ,.usb_reset_detect_o()
    ,.usb_en_o()
);

endmodule
