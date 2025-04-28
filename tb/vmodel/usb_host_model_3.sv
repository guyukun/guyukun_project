module usb_host_model_3
(
	input				DPIN,
	input				DNIN,

	output reg          DPDM_OE,
	output reg          DPOUT,
	output reg          DNOUT

);

`define HOSTCYCLE   10 
`define USBBIT	(`HOSTCYCLE*8)
integer Vector;

reg  [3:0] BitStuffTxCount, BitStuffRxCount;

initial begin
	DPDM_OE = 0;
	DPOUT   = 1;
	DNOUT   = 1;
end

// RX packet signals
reg rx_packet_valid;
integer rx_packet_length;
reg [7:0] rx_packet_data[0:1023]; // support up to 1024-byte packets

task usb_reset;
begin
//  @(posedge ClockUSB)
//  `ifdef VERBOSE
  $display ("%10.0f",Vector,,"  Resetting function controller");
//  `endif
  DPDM_OE = 1;
  DPOUT = 0; DNOUT = 0;
  #(32*`USBBIT) DPOUT = 1;
end
endtask


task SendDat;
input [15:0] dat;
input  [9:0] bits;
integer n;
begin
	
	$display("Send Dat %h,bits %h",dat,bits);
	DPDM_OE = 1;
  for (n=0; n<bits; n=n+1) begin
    if (dat[n] == 0) begin
      DPOUT = ~DPOUT;
      DNOUT = ~DNOUT;
      BitStuffTxCount = 0;
      end
    else BitStuffTxCount = BitStuffTxCount + 1;
    if (BitStuffTxCount == 6) begin
      #`USBBIT
      DPOUT = ~DPOUT;
      DNOUT = ~DNOUT;
      BitStuffTxCount = 0;
      end
    #`USBBIT;
    end
	DPDM_OE = 0;
end
endtask

task SendEop;
begin
	DPDM_OE = 1;
    DPOUT = 0; 
    DNOUT = 0;
    #`USBBIT;
    #`USBBIT;
	DPDM_OE = 0;        
end
endtask


// New task: Receive Data Packet
task ReceivePacket;
integer i;
reg last_dpin;
begin
	rx_packet_valid = 0;
	rx_packet_length = 0;

	// Wait for SYNC (KJKJKJKK pattern)
	wait(DPIN !== DNIN);
	#(`USBBIT * 8);

	// Receive PID (8 bits)
	rx_packet_data[rx_packet_length] = 0;
	for (i = 0; i < 8; i = i + 1) begin
		last_dpin = DPIN;
		#`USBBIT;
		if (DPIN == last_dpin)
			rx_packet_data[rx_packet_length][i] = 1;
		else
			rx_packet_data[rx_packet_length][i] = 0;
	end
	rx_packet_length = rx_packet_length + 1;

	// Receive Data until EOP detected
	while (!(DPIN == 0 && DNIN == 0)) begin
		rx_packet_data[rx_packet_length] = 0;
		for (i = 0; i < 8; i = i + 1) begin
			last_dpin = DPIN;
			#`USBBIT;
			if (DPIN == last_dpin)
				rx_packet_data[rx_packet_length][i] = 1;
			else
				rx_packet_data[rx_packet_length][i] = 0;
		end
		rx_packet_length = rx_packet_length + 1;
	end

	// Detected EOP
	#(`USBBIT * 2);
	
	rx_packet_valid = 1;
	$display("Host received packet, length = %0d bytes", rx_packet_length);
end
endtask

// Task to handle the full transaction (Receive and ACK)
task ReceiveAndAck;
begin
	ReceivePacket;

	if (rx_packet_valid) begin
		#(`USBBIT * 2); // Small delay before sending ACK
		SendDat(8'hD2, 8); // PID for ACK (0xD2 = ACK PID)
		SendEop;
		$display("Host sent ACK");
	end
end
endtask

endmodule

