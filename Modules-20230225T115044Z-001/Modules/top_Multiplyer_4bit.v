`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.08.2022 11:58:02
// Design Name: 
// Module Name: top_Multiplyer_4bit
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


module top_Multiplyer_4bit(a,b,ans);
//input output of multiplyer
input [3:0]a, b;
output [7:0]ans;

wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13;
wire f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15;
wire s1, s2, s3, s4, s5, s6;

//multiplication using adders and gate
and(ans[0], a[0], b[0]); 
and(f1, a[1], b[0]);
and(f2, a[0], b[1]);
half_adder A1(f1, f2, ans[1], c1);
and(f3, a[2], b[0]);
and(f4, a[1], b[1]);
and(f5, a[0], b[2]);
full_Adder A2(f3, f4, f5, s1, c2);
half_adder A3(s1, c1, ans[2], c3);
and(f6, a[3], b[0]);
full_Adder A4(f6, c2, c3, s2, c4);
and(f7, a[2], b[1]);
and(f8, a[1],b[2]);
and(f9, a[0], b[3]);
full_Adder A5(f7, f8, f9, s3, c5);
half_adder A6(s2, s3, ans[3], c6);
full_Adder A7(c4, c5, c6, s4, c7);
and(f10, a[3], b[1]);
and(f11, a[2],b[2]);
and(f12, a[1], b[3]);
full_Adder A8(f10, f11, f12, s5, c8);
half_adder A9(s4, s5, ans[4], c9);
full_Adder A10(c7, c8, c9, s6, c10);
and(f13, a[3], b[2]);
and(f14, a[2], b[3]);
full_Adder A11(f13, f14, s6, ans[5], c11);
and(f15, a[3], b[3]);
full_Adder A12(f15, c10, c11, ans[6], ans[7]);
endmodule

// full adder module using half adder
module full_Adder(af, bf, cinf, sumf, coutf);
input af, bf, cinf;
output sumf, coutf;
wire sum1,cout1,cout2,f;

half_adder FA1(af,bf,sum1,cout1);
half_adder FA2(sum1,cinf,sumf,cout2);
or(coutf, cout1, cout2);
endmodule


//half adder module
module half_adder(ah, bh, sumh, couth);
input ah, bh;
output sumh, couth;

xor(sumh, ah, bh);
and(couth, ah, bh);
endmodule