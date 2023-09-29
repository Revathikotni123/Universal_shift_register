module Mux_4_to_1(Mux_Out , S , in0 , in1 , in2 , in3);

output reg Mux_Out;
input [1:0] S;
input in0 , in1 , in2 , in3;

always@(*)
begin
	case(S)
		
		2'b00 : Mux_Out = in0;
		2'b01 : Mux_Out = in1;
		2'b10 : Mux_Out = in2;
		2'b11 : Mux_Out = in3;
	endcase
end

endmodule