`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2023 01:10:52
// Design Name: 
// Module Name: frequency_divider
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


module frequency_divider(clock_in, clock_out);
    input clock_in;                   
    output reg clock_out;            
    reg [27:0] counter = 28'd0;
    parameter total = 28'd100000000;   
    

    always@(posedge clock_in)begin
        counter <= counter + 28'd1;
        if(counter >= (total-1))begin
            counter <= 28'd0;
        end
        clock_out <= (counter < total/2)?1'b1:1'b0;
        end
endmodule
