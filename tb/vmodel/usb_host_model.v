
module usb_host_model
(
	input				DPIN ,
	input				DNIN ,
	
	output reg          DPDM_OE,
	output reg          DPOUT,
	output reg          DNOUT
	
);

`define HOSTCYCLE   10 

`define USBBIT	(`HOSTCYCLE*8)
integer Vector;




reg  [3:0] BitStuffTxCount, BitStuffRxCount;

initial begin
	DPDM_OE = 0 ;
	DPOUT   = 1 ;
	DNOUT   = 1 ;
end

//task list
//usb_reset


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


reg rx_packet_valid;
integer rx_packet_length;
reg [7:0] rx_packet_data[0:1023]; // support up to 1024-byte packets

integer i, bit_cnt, stuff_cnt;
reg [7:0] shift_reg;
reg last_dpin;
reg [1:0] dpdm;

task ReceivePacket;

begin
	rx_packet_valid = 0;
	rx_packet_length = 0;

	// Wait for SYNC (KJKJKJKK)
	wait (DPIN !== DNIN); // Differential signaling detected
	for (i = 0; i < 8; i = i + 1) #`USBBIT; // Wait for SYNC pattern

	bit_cnt = 0;
	stuff_cnt = 0;
	shift_reg = 0;

	// Start receiving data bits until EOP detected
	while (1) begin
		dpdm = {DPIN, DNIN};
		if (dpdm == 2'b00) begin // EOP detected (DP=0, DM=0)
			#(`USBBIT * 2);
			break;
		end

		last_dpin = DPIN;
		#`USBBIT;

		if ({DPIN, DNIN} == dpdm) begin
			shift_reg = {1'b1, shift_reg[7:1]};
			stuff_cnt = stuff_cnt + 1;
		end else begin
			shift_reg = {1'b0, shift_reg[7:1]};
			stuff_cnt = 0;
		end

		bit_cnt = bit_cnt + 1;

		// Bit stuffing handling
		if (stuff_cnt == 6) begin
			#`USBBIT; // Skip stuffed bit
			stuff_cnt = 0;
		end

		// Save byte every 8 bits
		if (bit_cnt == 8) begin
			rx_packet_data[rx_packet_length] = shift_reg;
			rx_packet_length = rx_packet_length + 1;
			bit_cnt = 0;
			shift_reg = 0;
		end
	end

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
		//SendDat(8'h80, 8);      // SYNC
		//SendDat(4'b0010, 4);    // PID ACK
  	//SendDat(4'b1101, 4);    // ~PID
  	SendDat(8'h4B, 8); // 标准USB ACK PID (0x4B)
		SendEop;
		$display("Host sent ACK");
	end
end
endtask




endmodule
