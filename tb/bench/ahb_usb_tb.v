

//`define TX_ERROR_TEST
//`include "ahb_defines.v"

`define TIME $display("  Time: %0t", $time)


                                             
module ahb_usb_tb();               
                                             
parameter AHB_CLK          =    20           ;
parameter USB_CLK_48m      =    21           ;
//register addreses

reg                        usb_clk_48m       ;


reg     [31:0]             hrdata_reg        ;
reg                        hclk              ;
reg                        hresetn           ;
wire                       s_hsel            ;
wire                         hready          ;
wire    [1:0]              s_htrans          ;
wire    [2:0]              s_hsize           ;
wire                       s_hwrite          ;
wire    [31:0]             s_haddr           ;
wire    [31:0]             s_hwdata          ;
wire                       s_hreadyout       ;
wire                       s_hresp           ;
wire    [31:0]             s_hrdata          ;

                                   

//usb interface
pullup(usb_dp);//D+
pulldown(usb_dn);//D-


initial begin
  $fsdbDumpfile("TEST_CASE.fsdb") ;
  $fsdbDumpvars(0,ahb_usb_tb       ) ;
  $fsdbDumpMDA();
  $timeformat  (-3, 3, "ms", 1)      ;
end

always
begin
    hclk=0;
    forever #(AHB_CLK/2) hclk = ~hclk;
end

always
begin
    usb_clk_48m=0;
    forever #(USB_CLK_48m/2) usb_clk_48m = ~usb_clk_48m;
end


task hard_reset;
begin
      hresetn = 1'b1; 
#116; hresetn = 1'b0;
      hresetn = 1'b1; 
end
endtask


assign hready = s_hreadyout ;

AHB_MST AHB_MST
(
.hclk           ( hclk      ),     
.hready         ( hready    ),
.ahb_mst_hlock  (   ),
.ahb_mst_hbusreq(   ),
.ahb_mst_hsel   ( s_hsel    ), 
.ahb_mst_hwrite ( s_hwrite  ),
.ahb_mst_htrans ( s_htrans  ),
.ahb_mst_haddr  ( s_haddr   ), 
.ahb_mst_hburst (   ), 
.ahb_mst_hsize  ( s_hsize   ), 
.ahb_mst_hprot  (   ),  
.ahb_mst_hwdata ( s_hwdata  ),  
.ahb_mst_hrdata ( s_hrdata  )

);

integer i;

// USB D+ / D-
wire           			usb_dp_i    	 ;
wire           			usb_dn_i    	 ;
wire					usb_dpdn_oe		 ;
wire          			usb_dp_o   		 ;
wire          			usb_dn_o   		 ;

wire           			DPIN     	 	 ;
wire           			DNIN     	 	 ;
wire					DPDM_OE			 ;
wire          			DPOUT   		 ;
wire          			DPOUT   		 ;

wire                    usb_dp           ;
wire                    usb_dn           ;

usb_device_top
usb_device_top(
.usb_clk_48m    (usb_clk_48m  ),
.usb_rstn       (hresetn      ),
.hclk           (hclk         ), 
.hresetn        (hresetn      ), 
.hsel           (s_hsel       ),
.hready         (hready       ),
.htrans         (s_htrans     ),
.hsize          (s_hsize      ),
.hwrite         (s_hwrite     ),
.haddr          (s_haddr      ),
.hwdata         (s_hwdata     ),
.hreadyout      (s_hreadyout  ),
.hresp          (s_hresp      ),
.hrdata         (s_hrdata     ),
.usb_dp_i       (usb_dp_i     ),
.usb_dn_i       (usb_dn_i     ),
.usb_dpdn_oe    (usb_dpdn_oe  ),
.usb_dp_o       (usb_dp_o     ),
.usb_dn_o       (usb_dn_o     ),
.intr_o           ()
);

trans_buffer
device_trans_buffer_dp
(
.input_io    (usb_dp_i),
.output_en   (usb_dpdn_oe),
.output_io   (usb_dp_o),
.inout_io    (usb_dp)
);

trans_buffer
device_trans_buffer_dn
(
.input_io    (usb_dn_i),
.output_en   (usb_dpdn_oe),
.output_io   (usb_dn_o),
.inout_io    (usb_dn)
);


usb_host_model
usb_host_model
(
.DPIN(DPIN),
.DNIN(DNIN),

.DPDM_OE(DPDM_OE),
.DPOUT(DPOUT),
.DNOUT(DNOUT)
);



trans_buffer
host_trans_buffer_dp
(
.input_io    (DPIN),
.output_en   (DPDM_OE),
.output_io   (DPOUT),
.inout_io    (usb_dp)
);

trans_buffer
host_trans_buffer_dn
(
.input_io    (DNIN),
.output_en   (DPDM_OE),
.output_io   (DNOUT),
.inout_io    (usb_dn)
);


`include `TEST_CASE

initial
begin
#1000000000;
//$display("timeout!");
$finish;
end


endmodule

