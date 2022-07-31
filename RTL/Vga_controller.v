`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2022 12:41:25 PM
// Design Name: 
// Module Name: Vga_controller
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

`define WIDTH 10
module Vga_controller
(input i_clk , 
 input i_rst_n , 
 output H_sync , 
 output V_sync , 
 output Vid_on , 
 output [`WIDTH-1:0] pix_x ,
 output [`WIDTH-1:0] pix_y);
 
 ///Here pix_x and pix_y indicates the relative positions of screen 
   //and the location of pixel //
   
  /////some of the important parameters in VGA ///
  ///Horizontal Trace//
  parameter H_Area = 800 ;  //Total Display area for horizontal Trace///
  parameter H_Disp = 640 ;  ///display area in horizontal trace during which video is ON//
   //video should be off during the following durations ///
  parameter H_retrace = 96 ; ///region in which the elctron beams return to left edge /// 
  parameter H_Front_porch = 16 ; ///right border of horizontal trace ///
  parameter H_Back_porch = 48 ; ///left border of Horizontal trace //
 
 //Vertical Trace///
  parameter V_Area = 525;  //Total Display area for Vertical Trace///
  parameter V_Disp = 480 ;      ///display area in vertical trace during which video is ON//
 //video should be off during the following durations ///
  parameter V_retrace = 2 ;   ///region in which electron beams return to the top of the screen 
  parameter V_Front_porch = 10 ;      //bottom border of vertical trace ///
  parameter V_Back_porch = 33 ;     ///top border of vertical trace //
 
 wire pix_clk_25MHZ ;
 
	Pix_clk_gen CLK(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n) , 
    .out_clk(pix_clk_25MHZ)
    );
 reg [`WIDTH-1:0] H_next_cnt , V_next_cnt;
 reg [`WIDTH-1:0] H_cnt ;
 reg [`WIDTH-1:0] V_cnt ;
///H_synch is asserted when horizontal counter is less than 96//
 assign H_sync = (H_cnt >=0 & H_cnt < H_retrace)?1'b1: 1'b0;
 //V_synch is asserted when vertical counter is less than 2 //
 assign V_sync = (V_cnt < V_retrace)?1'b1:1'b0;
 ///video should be on during (144 to 784  in Horizontal trace and 35 to 515 in Vertical Trace)//
 assign Vid_on = (H_cnt >(H_Back_porch + H_retrace-1) & H_cnt <=(H_Area-H_Front_porch)) & ((V_cnt >V_Back_porch+ V_retrace-1) & (V_cnt <=V_Area-V_Front_porch))?1'b1 : 1'b0;
 assign pix_x = H_cnt ;
 assign pix_y = V_cnt ;
 
 ///horizontal counter terminates here///
 wire H_total =  (H_cnt == H_Area-1)? 1'b1 :1'b0;   ////asserts when H_cnt reaches 799
  ///vertical counter terminates here///
 wire V_total =  (V_cnt == V_Area-1)?1'b1 : 1'b0;  //asserts when V_cnt reaches 524///
 
 
 always @(posedge i_clk or negedge i_rst_n)
         begin
          if (i_rst_n ==1'b0)
               begin
                  H_cnt <= 0;
                  V_cnt <= 0;
                   end
                 else
                     begin 
                  H_cnt <= H_next_cnt ;
                  V_cnt <= V_next_cnt ; 
           end
    end
                      
 ///horizontal MOD -800 counter ///
 always @(*)
           begin
                  if (pix_clk_25MHZ)
                         begin
                          if (H_total)
                       begin
                             H_next_cnt <= 0;
                                end
                          else
                              begin
                           H_next_cnt <= H_cnt + 1'b1 ;
                     end
                 end
              else
           begin
        H_next_cnt <=H_cnt ;         
       end 
 end 

        
 ///Vertical MOD-525 counter ///
 always @(*)
            if (pix_clk_25MHZ & H_total)
                 begin
                     if (V_total )
                             begin
                                V_next_cnt <= 0;
                                end
                                   else
                                        begin
                                       V_next_cnt <= V_cnt + 1'b1 ;
                                 end  
                             end
                         else
                    begin
                 V_next_cnt <= V_cnt ;
             end    
    
endmodule 
