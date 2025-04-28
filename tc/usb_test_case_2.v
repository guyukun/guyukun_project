integer i;
reg [31:0] hrdata_reg;


initial begin
	
  hresetn = 1'b0;
  AHB_MST.AHB_IDLE;
  #200;
  hard_reset;
  #200;

	#(AHB_CLK  * 1)    AHB_MST.AHB_SIGNLE_WR (32'h0 , 32'h0000_0000f);    
  #(AHB_CLK  * 1)    AHB_MST.AHB_SIGNLE_WR (32'h8 , 32'h0000_0000f); 
    
  for(i=0;i<89;i=i+4) begin
  	#(AHB_CLK  * 2);   AHB_MST.AHB_SIGNLE_RD ( i , hrdata_reg   ); 
  end
  
  
  //flush ep0 fifo   
  #(AHB_CLK  * 2);   AHB_MST.AHB_SIGNLE_WR ( 32'h10 , 32'h0002_0000   );  

  // 2. 配置端点0为TX模式，启用传输
  #(AHB_CLK  * 2);   AHB_MST.AHB_SIGNLE_WR ( 32'h10 , 32'h0001_0004   );      
 

  for(i=0;i<64;i=i+1) begin
  	wait(ahb_usb_tb.usb_device_top.usbf_device.u_fifo_tx_ep0.full_o == 0);
  	AHB_MST.AHB_SIGNLE_WR ( 32'h1c , i   );
  	#(AHB_CLK  * 20);   
  end

  // 4. Host端发送IN Token（请求数据）
  #1000;
  //force ahb_usb_tb.usb_device_top.usbf_device.u_ep0.tx_start_i = 1'b1;
  //force ahb_usb_tb.usb_device_top.usbf_device.u_ep0.tx_length_i[10:0] = 11'd8;
  usb_host_model.usb_reset;
  usb_host_model.SendDat(8'h80, 8);      // SYNC
  usb_host_model.SendDat(4'b1001, 4);    // PID IN
  usb_host_model.SendDat(4'b0110, 4);    // ~PID
  usb_host_model.SendDat(7'b0000000, 7); // Device address (0)
  usb_host_model.SendDat(4'b0000, 4);    // EP0
  usb_host_model.SendDat(5'b00000, 5);   // CRC5 (auto)
  usb_host_model.SendEop;

  // 5. Host端接收Device数据包并发送ACK
  usb_host_model.ReceivePacket;

  // 仿真结束
  #100000;
  $finish;
end

