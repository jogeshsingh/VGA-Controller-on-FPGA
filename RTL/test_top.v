`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2022 11:30:40 AM
// Design Name: 
// Module Name: test_top
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


module test_top();
reg i_clk ; 
reg i_rst_n  ;
reg [11:0] d_in ;  
wire H_sync ; 
wire V_sync ;
wire [11:0]RGB_out ;
//wire vid_on ;

Top_design DUT(
i_clk , 
i_rst_n  ,
 d_in ,  
H_sync , 
V_sync ,  
RGB_out
);


initial
 begin
  i_clk = 1'b0;
   i_rst_n = 1'b0;
   d_in = 12'b0000_0010_0010_0011;
   end
   
   always #5 i_clk = ~i_clk ;
   
   
   
   initial
         begin
           #4 i_rst_n = 1'b1 ;
            #2 d_in = 12'b0000_0111_0001_0000;
            end 
            
endmodule
