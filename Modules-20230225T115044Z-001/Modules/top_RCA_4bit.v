`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2022 23:14:58
// Design Name: 
// Module Name: top_RCA_4bit
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


module top_RCA_4bit(a, b, cin, cout, sum);
parameter n = 8;

//initializing variables
input [n-1:0]a, b; //input variables of 8 bit
input cin;
output [n-1:0]sum; //output variable of 8 bit
output cout;

//addition using full adder module
wire c0,c1,c2,c3,c4,c5,c6;
full_Adder FA3(a[0], b[0], cin, sum[0],c0);
full_Adder FA4(a[1], b[1], c0, sum[1],c1);
full_Adder FA5(a[2], b[2], c1, sum[2],c2);
full_Adder FA6(a[3], b[3], c2, sum[3],c3);
full_Adder FA7(a[4], b[4], c3, sum[4],c4);
full_Adder FA8(a[5], b[5], c4, sum[5],c5);
full_Adder FA9(a[6], b[6], c5, sum[6],c6);
full_Adder FA10(a[7], b[7], c6, sum[7],cout);

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