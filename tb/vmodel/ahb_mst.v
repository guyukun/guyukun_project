

module AHB_MST(
input               hclk           ,
input               hready         ,

output reg          ahb_mst_hlock  ,
output reg          ahb_mst_hbusreq,
output reg          ahb_mst_hsel   , 
output reg          ahb_mst_hwrite ,
output reg  [ 1:0]  ahb_mst_htrans ,
output reg  [31:0]  ahb_mst_haddr  , 
output reg  [ 2:0]  ahb_mst_hburst , 
output reg  [ 2:0]  ahb_mst_hsize  , 
output reg  [ 3:0]  ahb_mst_hprot  ,  
output reg  [31:0]  ahb_mst_hwdata ,  
input       [31:0]  ahb_mst_hrdata 

);



//////////////////////////////////////////////////////////
task AHB_IDLE;
    begin
        ahb_mst_hlock   <= 1'b0      ;
        ahb_mst_hsel    <= 1'b0      ;
        ahb_mst_htrans  <= 2'b00     ;//IDLE
        ahb_mst_haddr   <= 32'h0000  ;
        ahb_mst_hburst  <= 3'b000    ;//
        ahb_mst_hwrite  <= 1'b0      ;// 
        ahb_mst_hbusreq <= 1'b0      ; 
        ahb_mst_hsize   <= 3'b010    ;//32
        ahb_mst_hprot   <= 4'b1111   ;//full func
        ahb_mst_hwdata  <= 32'h0000  ;
    end
endtask



task            AHB_SIGNLE_WR ;

input   [31:0]  AHB_HADDR     ;
input   [31:0]  AHB_HWDATA    ;

begin

repeat (1) @ (posedge hclk)

begin
ahb_mst_hsel    <= 1'b1      ;
ahb_mst_htrans  <= 2'b10     ;//NONSEQ
ahb_mst_haddr   <= AHB_HADDR ;
ahb_mst_hburst  <= 3'b000    ;//signle
ahb_mst_hwrite  <= 1'b1      ;//write 
ahb_mst_hsize   <= 3'b010    ;//32
ahb_mst_hprot   <= 4'b1111   ;//full func
end

//$display($time, " << write start >>");
repeat (1)  @ (posedge hclk)

begin
    wait (hready == 1'b1)  ahb_mst_hwdata  <= AHB_HWDATA; 
    ahb_mst_hsel    <= 1'b0      ;
    ahb_mst_htrans  <= 2'b00     ;//IDLE
    ahb_mst_haddr   <= 32'h0000  ;
    ahb_mst_hburst  <= 3'b000    ;//
    ahb_mst_hwrite  <= 1'b0      ;// 
    ahb_mst_hsize   <= 3'b010    ;//32
    ahb_mst_hprot   <= 4'b1111   ;//full func
    ahb_mst_hbusreq <= 1'b0      ; 
end

repeat (1)  @ (posedge hclk)
ahb_mst_hwdata<=32'h0;
//$display($time, " << write done >>");

end
endtask






task AHB_SIGNLE_RD ;
input   [31:0]  AHB_HADDR  ;
output  [31:0]  AHB_HRDATA ;
begin
repeat (1) @ (posedge hclk);
begin
ahb_mst_hsel    <= 1'b1      ;
ahb_mst_htrans  <= 2'b10     ;//NONSEQ
ahb_mst_haddr   <= AHB_HADDR ;
ahb_mst_hburst  <= 3'b000    ;//signle
ahb_mst_hwrite  <= 1'b0      ;//read 
ahb_mst_hsize   <= 3'b010    ;//32
ahb_mst_hprot   <= 4'b1111   ;//full func
end

repeat (1) @ (posedge hclk);

//$display($time, " << read start >>");
repeat (1) @ (posedge hclk);
begin
wait (hready == 1'b1)  

AHB_HRDATA = ahb_mst_hrdata  ;

ahb_mst_hsel    <= 1'b0      ;
ahb_mst_htrans  <= 2'b00     ;//IDLE
ahb_mst_haddr   <= 32'h0000  ;
ahb_mst_hburst  <= 3'b000    ;//
ahb_mst_hwrite  <= 1'b0      ;// 
ahb_mst_hsize   <= 3'b010    ;//32
ahb_mst_hprot   <= 4'b1111   ;//full func
ahb_mst_hwdata  <= 32'h0000  ;
ahb_mst_hbusreq <= 1'b0      ; 
//$display($time, " << read done >>");
end
end
endtask

endmodule
