`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2023 20:50:20
// Design Name: 
// Module Name: top_encoder
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


module top_encoder(a, en, out );
input [7:0]a; //input variable
input en;
output reg [2:0]out;
//priority encoder
always @(en, a)
begin
if (en)
    begin
    if(a[7] == 1) //when highest bit is 1 then output will be 7;
        out = 3'b111;
    else if(a[6] == 1)
        out = 3'b110;
    else if(a[5] == 1)
        out = 3'b101;
    else if(a[4] == 1)
        out = 3'b100;
    else if(a[3] == 1)
        out = 3'b011;
    else if(a[2] == 1)
        out = 3'b010;
    else if(a[1] == 1)
        out = 3'b001;
    else 
        out = 3'b000;
    end
else
    out = 3'bzzz;
end                                               
endmodule
