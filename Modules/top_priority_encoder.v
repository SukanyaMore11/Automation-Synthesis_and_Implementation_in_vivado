`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 17:49:36
// Design Name: 
// Module Name: top_priority_encoder
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


module top_priority_encoder(a,out,valid);
input [7:0]a;
output valid;
output [2:0]out;

wire y0, y1, y2;
wire f1,f2,f3,f4,f5,f6,f7,f8,f9;
wire z1,z2,z3;
// y2 = a[7]|~a[7]&a[6]|~a[7]&~a[6]&a[5]|~a[7]&~a[6]&~a[5]&a[4]
// y1 = a[7]|~a[7]&a[6]|~a[7]&~a[6]&~a[5]&~a[4]&a[3]|~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&a[2]
// y0 = a[7]|~d[7]&~a[6]&a[5]|~a[7]&~a[6]&~a[5]&~a[4]&a[3]|~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&~a[2]&a[1]
and(f1, ~a[7], a[6]);
and(f2, ~a[7], ~a[6], a[5]);
and(f3, ~a[7], ~a[6], ~a[5], a[4]);
or(out[2], a[7], f1, f2, f3);
and(f4, ~a[7], a[6]);
and(f5, ~a[7], ~a[6], ~a[5], ~a[4], a[3]);
and(f6, ~a[7], ~a[6], ~a[5], ~a[4], ~a[3], a[2]);
or(out[1], a[7], f4, f5, f6);
and(f7, ~a[7], ~a[6],a[5]);
and(f8, ~a[7], ~a[6], ~a[5], ~a[4], a[3]);
and(f9, ~a[7], ~a[6], ~a[5], ~a[4], ~a[3], ~a[2], a[1]);
or(out[0], a[7], f7, f8, f9);
or(valid, a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]);


endmodule
