`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 19:12:18
// Design Name: 
// Module Name: top_moore
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


module top_moore(w,clk,reset,z);
input w,clk,reset; //input variables
output z;
reg [2:0]P_State,N_State; //present and next states
//defining states
parameter [2:0]A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100;

always @(w,P_State)
case(P_State)
A:if(w==0)N_State=B;
    else N_State=A;
B:if(w==0)N_State=C;
    else N_State=A;
C:if(w==0)N_State=C;
    else N_State=D;
D:if(w==0)N_State=B;
    else N_State=E;
E:if(w==0)N_State=B;
    else N_State=A;
default: N_State=3'bxxx;
endcase
//assigning next state to present test
always @(negedge reset,posedge clk)
begin
if(reset==0)
P_State <= A;
else
P_State <= N_State;
end
assign z = (P_State==E); //assigning output
endmodule
