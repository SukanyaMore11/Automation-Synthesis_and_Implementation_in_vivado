`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 11:37:49
// Design Name: 
// Module Name: top_mealy
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_mealy(reset,clk,w,z);
input reset,clk,w;
output reg z;

reg [1:0]P_State, N_State;

parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;

always@(w,P_State)
case(P_State)
A: begin
       if(w==0)begin z=0; N_State = B; end
       else begin z=0; N_State = A; end
       end
B: begin
       if(w==0)begin z=0; N_State = C; end
       else begin z=0; N_State = A; end
       end
C: begin
       if(w==0)begin z=0; N_State = C; end
       else begin z=0; N_State = D; end
       end
D: begin
       if(w==0)begin z=0; N_State = B; end
       else begin z=1; N_State = A; end
       end
endcase

always@(posedge clk, negedge reset)
begin
if(!reset)
P_State <= A;
else
P_State <= N_State;
end
endmodule
