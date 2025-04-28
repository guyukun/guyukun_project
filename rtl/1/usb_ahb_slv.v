/*==================================================================================*\
Filename: 
Author: zyh
Description: usb_ahb_slv
Call by: 
Date: 2024.9.17
Revision History: 1.1
Company: 
\*==================================================================================*/
                                                             
module usb_ahb_slv
(                                                       
    input                               hclk                ,
    input                               hresetn             ,
    input                               hsel                ,
    input                               hready              ,
    input           [1:0]               htrans              ,
    input           [2:0]               hsize               ,
    input                               hwrite              ,
    input           [31:0]              haddr               ,
    input           [31:0]              hwdata              ,
    output                              hreadyout           ,
    output                              hresp               ,
    output          [31:0]              hrdata              ,
                                                             
    // regfile interface                                     
    output                              wr_en               ,
    output                              rd_en               ,
    output          [31:0]              reg_addr            ,
    output          [31:0]              ipwdata             ,
    input           [31:0]              iprdata              
);                                                           
                                                             
    wire                                wr_enx              ;                      
    wire                                ahb_access          ;
    wire                                ahb_read            ;
    reg                                 ahb_write           ;
    reg             [31:0]              haddr_d             ;
                                                                                                                        
    assign  ahb_access   = htrans[1]& hsel & hready ;          
    assign  ahb_read_req = ahb_access & (~hwrite )  ;          
    assign  ahb_write_req= ahb_access &   hwrite    ; 

	reg                                 read_en_reg         ;
	wire                                update_read_req     ;
	reg                                 write_en_reg        ;
	wire                                update_write_req    ;
	
  assign update_read_req = ahb_read_req | (read_en_reg & hready);

  always @(posedge hclk or negedge hresetn)
  begin
    if (~hresetn)
      begin
        read_en_reg <= 1'b0;
      end
    else if (update_read_req)
      begin
        read_en_reg  <= ahb_read_req;
      end
  end


  assign update_write_req = ahb_write_req |( write_en_reg & hready); 

  always @(posedge hclk or negedge hresetn)
  begin
    if (~hresetn)
      begin
        write_en_reg <= 1'b0;
      end
    else if (update_write_req)
      begin
        write_en_reg  <= ahb_write_req;
      end
  end
                                                                                                                          
    always@(posedge hclk or negedge hresetn) begin           
        if(~hresetn)                                         
            haddr_d <= 32'h0 ;                               
        else if(ahb_access )                         
            haddr_d <= haddr ;                               
    end                                                      
                                                             
                                                             
    assign hresp     = 0;                                    
    assign hreadyout = 1;                                    
    assign hrdata    = iprdata;                                                                                        
                                                             
    assign wr_en     = write_en_reg;                            
    assign rd_en     = read_en_reg ;                                                       
    assign reg_addr  = haddr_d;                      
    assign ipwdata   = hwdata;                               
                                                             
endmodule
                                                  
