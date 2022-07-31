`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2022 12:40:45 PM
// Design Name: 
// Module Name: Top_design
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

`define N_WIDTH 12
module Top_design(
input i_clk , 
input i_rst_n  ,
input [`N_WIDTH-1:0] d_in ,  
output H_sync , 
output V_sync , 
output [`N_WIDTH-1:0] RGB_out
);

wire vid_on ;

reg [`N_WIDTH-1:0] o_RGB;
always @(posedge i_clk or negedge i_rst_n)
    begin 
      if (i_rst_n==1'b0)
           begin
              o_RGB <= 0;
              end
            else
          begin     
       o_RGB <= d_in ;
    end
 end    
Vga_controller VGA
  (.i_clk(i_clk) , 
   .i_rst_n(i_rst_n) , 
   .H_sync(H_sync) , 
   .V_sync(V_sync) , 
   .Vid_on(vid_on) ,  
   .pix_x() ,
   .pix_y());
  
 assign RGB_out   = vid_on? o_RGB:12'b0;
 



endmodule
