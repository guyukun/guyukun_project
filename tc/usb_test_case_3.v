initial begin
  integer i;
  
  hresetn = 1'b0;
  AHB_MST.AHB_IDLE;
  #200;
  hard_reset;
  #200;

  // Step1: Device IP软复位与初始化
  #(AHB_CLK  * 1)    
  AHB_MST.AHB_SIGNLE_WR (32'h0 , 32'h0000_0000f);    
  #(AHB_CLK  * 1)    
  AHB_MST.AHB_SIGNLE_WR (32'h8 , 32'h0000_0000f); 

  // Step2: 配置EP0为RX模式（OUT端点，准备接收数据）
  #(AHB_CLK  * 2);   
  AHB_MST.AHB_SIGNLE_WR ( 32'h14 , 32'h0000_0002   ); //Flush EP0 FIFO
  #(AHB_CLK*2);
  AHB_MST.AHB_SIGNLE_WR(32'h14, 32'h0000_0001);  // EP0, RX模式, FIFO使能, Packet=64B

  // Step3: 主机端发出OUT Token (PID=0xE1)
  #(AHB_CLK*10);
  usb_host_model.usb_reset;

  usb_host_model.SendDat(8'h80, 8);      // SYNC
  usb_host_model.SendDat(4'b0001, 4);    // PID OUT (0xE1)
  usb_host_model.SendDat(4'b1110, 4);    // ~PID
  usb_host_model.SendDat(7'b0000000, 7); // Device地址 (0)
  usb_host_model.SendDat(4'b0000, 4);    // EP0
  usb_host_model.SendDat(5'b00000, 5);   // CRC5自动计算
  // usb_host_model.SendEop;

  // Step4: 主机发送DATA Packet (PID=0xC3 DATA0包)
  // #(AHB_CLK*2);
  // usb_host_model.SendDat(8'h80, 8);      // SYNC
  usb_host_model.SendDat(4'b0011, 4);    // PID OUT (0xC3)
  usb_host_model.SendDat(4'b1100, 4);    // ~PID

  // 发送64字节数据（示例数据：0x00~0x3F）
  for (i = 0; i < 64; i = i + 1) begin
    usb_host_model.SendDat(i[7:0], 8);
  end

  usb_host_model.SendDat(16'hFFFF, 16); // 模拟发送CRC16 (实际CRC可自动处理)
  usb_host_model.SendEop;

  // Step5: Host等待Device返回ACK
  usb_host_model.ReceivePacket;

  if (usb_host_model.rx_packet_valid && 
      usb_host_model.rx_packet_length == 1 &&
      usb_host_model.rx_packet_data[0] == 8'h4B) begin
    $display("Host received ACK from Device.");
  end else begin
    $display("Host did not receive ACK from Device.");
  end

  #(AHB_CLK*100);
  $finish;
end

