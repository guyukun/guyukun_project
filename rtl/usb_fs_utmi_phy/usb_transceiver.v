/*==================================================================================*\
Filename: 
Author: zyh
Description: usb_transceiver
Call by: 
Date: 2024.9.17
Revision History: 1.1
Company: 
\*==================================================================================*/

module usb_transceiver
(
    // Inputs
     input           usb_phy_tx_dp_i
    ,input           usb_phy_tx_dn_i
    ,input           usb_phy_tx_oen_i
    ,input           mode_i

    ,input           usb_dp_i
    ,input           usb_dn_i
    ,output			 usb_dpdn_oe
    ,output          usb_dp_o
    ,output          usb_dn_o
    ,output          usb_phy_rx_rcv_o
    ,output          usb_phy_rx_dp_o
    ,output          usb_phy_rx_dn_o
);



//-----------------------------------------------------------------
// Module: usb_transceiver
// Emulate standard USB PHY interface and produce a D+/D- outputs.
// Allows direct connection of USB port to FPGA.
// Limitations:
// As no differential amplifier present, no common mode noise
// rejection occurs.
// Unlikely to work well with longer connections!
//-----------------------------------------------------------------

//-----------------------------------------------------------------
// Wires
//-----------------------------------------------------------------
reg out_dp;
reg out_dn;

//-----------------------------------------------------------------
// Assignments
//-----------------------------------------------------------------

assign usb_dpdn_oe = (usb_phy_tx_oen_i == 1'b0);

// D+/D- Tristate buffers
assign usb_dp_o = (usb_phy_tx_oen_i == 1'b0) ? out_dp : 1'bz;
assign usb_dn_o = (usb_phy_tx_oen_i == 1'b0) ? out_dn : 1'bz;

// Receive D+/D-
assign usb_phy_rx_dp_o = usb_dp_i;
assign usb_phy_rx_dn_o = usb_dn_i;

// Receive output
assign usb_phy_rx_rcv_o = (usb_dp_i == 1'b1 && usb_dn_i == 1'b0) ? 1'b1 : 1'b0;

// PHY Transmit Mode:
// When phy_tx_mode_i is '0' the outputs are encoded as:
//     vmo_i, vpo_i
//      0    0    Differential Logic '0'
//      0    1    Differential Logic '1'
//      1    0    Single Ended '0'
//      1    1    Single Ended '0'
// When phy_tx_mode_i is '1' the outputs are encoded as:
//     vmo_i, vpo_i
//      0    0    Single Ended '0'
//      0    1    Differential Logic '1'
//      1    0    Differential Logic '0'
//      1    1    Illegal State
always @ (mode_i or usb_phy_tx_dp_i or usb_phy_tx_dn_i)
begin : MUX
 case(mode_i)
    1'b0:
    begin
        if (usb_phy_tx_dp_i == 1'b0 && usb_phy_tx_dn_i == 1'b0)
        begin
            // Logic "0"
            out_dp = 1'b0;
            out_dn = 1'b1;
        end
        else if (usb_phy_tx_dp_i == 1'b0 && usb_phy_tx_dn_i == 1'b1)
        begin
            // SE0 (both low)
            out_dp = 1'b0;
            out_dn = 1'b0;
        end
        else if (usb_phy_tx_dp_i == 1'b1 && usb_phy_tx_dn_i == 1'b0)
        begin
            // Logic "1"
            out_dp = 1'b1;
            out_dn = 1'b0;
        end
        else if (usb_phy_tx_dp_i == 1'b1 && usb_phy_tx_dn_i == 1'b1)
        begin
            // SE0 (both low)
            out_dp = 1'b0;
            out_dn = 1'b0;
        end
    end
    1'b1 :
    begin
        if (usb_phy_tx_dp_i == 1'b0 && usb_phy_tx_dn_i == 1'b0)
        begin
            // SE0 (both low)
            out_dp = 1'b0;
            out_dn = 1'b0;
        end
        else if (usb_phy_tx_dp_i == 1'b0 && usb_phy_tx_dn_i == 1'b1)
        begin
            // Logic "0"
            out_dp = 1'b0;
            out_dn = 1'b1;
        end
        else if (usb_phy_tx_dp_i == 1'b1 && usb_phy_tx_dn_i == 1'b0)
        begin
            // Logic "1"
            out_dp = 1'b1;
            out_dn = 1'b0;
        end
        else if (usb_phy_tx_dp_i == 1'b1 && usb_phy_tx_dn_i == 1'b1)
        begin
            // Illegal
            out_dp = 1'b1;
            out_dn = 1'b1;
        end
    end
 endcase
end


endmodule
