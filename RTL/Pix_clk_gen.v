`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/30/2022 02:43:18 PM
// Design Name: 
// Module Name: Pix_clk_gen
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


module Pix_clk_gen(
    input i_clk,
    input i_rst_n , 
    output out_clk
    );
    reg [1:0] clk_cnt = 0 ;
    
    always @(posedge i_clk or negedge i_rst_n)
            begin
              if (i_rst_n==1'b0)
                    begin
                      clk_cnt <= 0;
                         end
                      else
                   begin      
                 clk_cnt <= clk_cnt + 1'b1 ;
               end
           end
       assign out_clk = (clk_cnt == 2'b00)?1'b1: 1'b0;
             
endmodule
