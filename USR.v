`include "4_1_MUX.v"
`include "DFF.v"

module USR(O , clk , clear , S , I, SIL, SIR);

input clk , clear ;
input [1 : 0] S ; 
input [3 : 0] I; 
input SIL, SIR;
output [3 : 0] O;
wire [3 : 0] D_temp;

Mux_4_to_1 inst1(D_temp[0] , S , O[0] , O[1] , SIL, I[0]);
Mux_4_to_1 inst2(D_temp[1] , S , O[1] , O[2] , O[0] , I[1]);
Mux_4_to_1 inst3(D_temp[2] , S , O[2] , O[3] , O[1] , I[2]);
Mux_4_to_1 inst4(D_temp[3] , S , O[3] , SIR, O[2] ,I[3]);

D_FlipFlop D_inst1(O[0] , D_temp[0] , clk , clear);
D_FlipFlop D_inst2(O[1] , D_temp[1] , clk , clear);
D_FlipFlop D_inst3(O[2] , D_temp[2] , clk , clear);
D_FlipFlop D_inst4(O[3] , D_temp[3] , clk , clear);

endmodule