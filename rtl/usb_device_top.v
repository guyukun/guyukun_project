/*==================================================================================*\
Filename: 
Author: zyh
Description: usb_device_top
Call by: 
Date: 2024.9.17
Revision History: 1.1
Company: 
\*==================================================================================*/

module usb_device_top
(
	input                       usb_clk_48m      ,
	input                       usb_rstn         ,

    // USB D+ / D-
    input           			usb_dp_i    	 ,
    input           			usb_dn_i    	 ,
    output						usb_dpdn_oe		 ,
    output          			usb_dp_o   		 ,
    output          			usb_dn_o   		 ,

    input                       hclk             ,
    input                       hresetn          ,
    //ahb slave
    input                       hsel             ,
    input                       hready           ,
    input       [1:0]           htrans           ,
    input       [2:0]           hsize            ,
    input                       hwrite           ,
    input       [31:0]          haddr            ,
    input       [31:0]          hwdata           ,
    output                      hreadyout        ,
    output                      hresp            ,
    output      [31:0]          hrdata           ,
    
    output                      intr_o

);

	wire 		           		rd_en   		 ;
	wire 		           		wr_en   		 ;
	wire 		[31:0] 	   		reg_addr		 ;
	wire 		[31:0]     		ipwdata 		 ;
	wire 		[31:0]     		iprdata 		 ;


	wire        [7:0]   	    utmi_data_in     ;
	wire                	    utmi_txready     ;
	wire                	    utmi_rxvalid     ;
	wire                	    utmi_rxactive    ;
	wire                	    utmi_rxerror     ;
	wire        [1:0]   	    utmi_linestate   ;
	                    	    
	wire        [7:0]   	    utmi_data_out    ;
	wire                	    utmi_txvalid     ;
	wire        [1:0]   	    utmi_op_mode     ;
	wire        [1:0]   	    utmi_xcvrselect  ;
	wire                	    utmi_termselect  ;
	wire                	    utmi_dppulldown  ;
	wire                	    utmi_dmpulldown  ;

	usb_ahb_slv
	usb_ahb_slv
	(
    .hclk               (hclk      				),
    .hresetn            (hresetn   				),
    .hsel               (hsel       			),
    .hready             (hready     			),
    .htrans             (htrans     			),
    .hsize              (hsize      			),
    .hwrite             (hwrite     			),
    .haddr              (haddr      			),
    .hwdata             (hwdata     			),
    .hreadyout          (hreadyout  			),
    .hresp              (hresp      			), 
    .hrdata             (hrdata     			), 
    .wr_en              (wr_en      			),   
    .rd_en              (rd_en      			),
    .reg_addr           (reg_addr   			),
    .ipwdata            (ipwdata    			),
    .iprdata            (iprdata    			)	
	);
	

	usbf_device
	usbf_device
	(
    // Inputs
    .clk_i           	(hclk           		),
    .rst_i           	(~hresetn          		),
	.cfg_addr_i			(reg_addr				),
	.cfg_rvalid_i       (rd_en					),
	.cfg_wvalid_i		(wr_en					),
	.cfg_wdata_i		(ipwdata				),
	
    .utmi_data_in_i  	(utmi_data_in  			),
    .utmi_txready_i  	(utmi_txready  			),
    .utmi_rxvalid_i  	(utmi_rxvalid  			),
    .utmi_rxactive_i 	(utmi_rxactive 			),
    .utmi_rxerror_i  	(utmi_rxerror  			),
    .utmi_linestate_i	(utmi_linestate			),

    // Outputs
    .cfg_rdata_o        (iprdata				),
    		
	.intr_o           	(intr_o           		),	
	.utmi_data_out_o  	(utmi_data_out  		),	
	.utmi_txvalid_o   	(utmi_txvalid   		),	
	.utmi_op_mode_o   	(utmi_op_mode   		),	
	.utmi_xcvrselect_o	(utmi_xcvrselect		),	
	.utmi_termselect_o	(utmi_termselect		),	
	.utmi_dppulldown_o	(utmi_dppulldown		),	
	.utmi_dmpulldown_o	(utmi_dmpulldown		)	
	);


	usb_fs_utmi_phy
	usb_fs_utmi_phy
	(
	.clk_i              (usb_clk_48m			),
	.rst_i              (~usb_rstn				),
	
	.utmi_data_out_i    (utmi_data_out  		),
	.utmi_txvalid_i     (utmi_txvalid   		),
	.utmi_op_mode_i     (utmi_op_mode   		),
	.utmi_xcvrselect_i  (utmi_xcvrselect		),
	.utmi_termselect_i  (utmi_termselect		),
	.utmi_dppulldown_i  (utmi_dppulldown		),
	.utmi_dmpulldown_i  (utmi_dmpulldown		),
	.utmi_data_in_o     (utmi_data_in   		),
	.utmi_txready_o     (utmi_txready   		),
	.utmi_rxvalid_o     (utmi_rxvalid   		),
	.utmi_rxactive_o    (utmi_rxactive  		),
	.utmi_rxerror_o     (utmi_rxerror   		),
	.utmi_linestate_o   (utmi_linestate 		),

    // USB D+ / D-
    .usb_dp_i		    (usb_dp_i  				),       				
    .usb_dn_i		    (usb_dn_i  				),       				
    .usb_dpdn_oe	    (usb_dpdn_oe			),  				  
    .usb_dp_o		    (usb_dp_o  				),       				
    .usb_dn_o		    (usb_dn_o	  			)       				

	);

endmodule
