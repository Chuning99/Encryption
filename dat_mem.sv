// Create Date:    2022.05.05
// Module Name:    dat_mem 
//
// works as a ROM, register file, or RAM 
// $clog2(N) = ceiling (log2(N)) -- use to determine pointer width needed
// two-dimensional array
// default size = 8 bits wide x 256 words deep, 
//   where each word is one byte wide, in this case 
// writes are clocked/sequential; reads are combinational

/*****************************************
* Implement TODO
*****************************************/

module dat_mem #(parameter W=8, byte_count=256)(
  input                           clk,
                                  write_en,  // write (store) enable
  input  [$clog2(byte_count)-1:0] raddr,     // read pointer
                                  waddr,     // write (store) pointer
  input  [ W-1:0]                 data_in,
  output [ W-1:0]                 data_out
    );

// W bits wide [W-1:0] and byte_count registers deep 	 
logic [W-1:0] core[byte_count];	 

//Check checkpoint for hints on what to code 

// also memory write address pointer (how many bits?),
//	read address pointer,
//  8-bit-wide data in,
//  8-bit-wide data out,
//  mem write enable (1 bit)
// memory core contents
//   operands test bench provides to you
// [4:55]   = original message (52 characters)
// [0]     = preamble length   (max 12 characters)
// [1]     = feedback taps in bits [4:0]   
// [2]     = LFSR starting state in bits [4:0]
//   results you provide to the test bench 
// [128:191] = padded & encrypted message (64 characters)

// combinational reads from Memory
//TODO
   assign     data_out = core[raddr];

// sequential (clocked) writes, with enable to prevent accidental overwrites
//TODO
   always_ff @(posedge clk)
	   if(write_en) begin
		  core[waddr] <= data_in;
		  end
endmodule	  
