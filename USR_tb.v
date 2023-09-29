`include "USR.v"
`timescale 1ns / 1ps
module USR_tb;

	// Inputs
	reg clk;
	reg clear;
	reg [1:0] S;
	reg [3:0] I;
    reg SIL;
    reg SIR;

	// Outputs
	wire [3:0] O;

	// Instantiate the Unit Under Test (UUT)
	USR uut (
		.O(O), 
		.clk(clk), 
		.clear(clear), 
		.S(S), 
		.I(I),
        .SIL(SIL),
        .SIR(SIR)
	);

always #50 clk = ~clk ;

	initial 
    begin
    $dumpfile ("USR.vcd"); 
    $dumpvars (0, USR_tb);

		clk = 1'b0;
		clear = 1'b1;
		I = 4'b1001;
		S = 2'b11;
        SIL = 1'b0;
        SIR = 1'b1;

		#10 clear = 1'b0;
		
		#50 clear = 1'b1;
			
		#140 S = 2'b10;
			  I = 4'b1101;
				
		#100 S = 2'b11;
			  
		#100 S = 2'b01;

		#100 S = 2'b00;		

	   #100 S = 2'b10;
		
		#100 S = 2'b11;
		
		#100 S = 2'b00;
		#30 $finish;

	end
      
endmodule
