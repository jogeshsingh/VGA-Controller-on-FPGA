# VGA-Controller-on-FPGA
 # Introduction
  VGA = Video Graphics Array , it is an analaog interface typically used for displaying video colors on display(PC). In this project , VGA includes 640 * 480 pixels    display resolution in which is used fowitches via FPGA through













              
  # Horizontal Timing
                                                 One_Horizontal_scan 
                                                      (800 pixels)
                                  <------------------------------------------------------------->
                         H_back_porch                                H_Front_porch        H_back_porch  
                            (48)                                        (16)                (48)        
         _________           _____|_____________________________________|____             ______|__
                  |_________|     |                                     |    |___________|      |
                    H_sync        start              H_disp             end       H_sync
                     (96)         143              (640)                783         (96)
                    
 
 
 
 
 
 # Vertical Timing
       
                           One_Vertical_line (525 pixels)
              <------------------------------------------------> 
          
           V_back_porch                         V_front_porch
                                                           V_back_porch
           (33)                                   (10)   <----->(33)
    ____    ___|_________________________________|____    ________
        |__|   |                                 |    |__|  
       V_sync  |             Vdisp               |    V_sync
        (2)    |             (480)               |      (2)
               (35)                             (512)


 
 # Timing Calculation
            pixel clk = 25 MHZ = 0.04 us 
            horizontal_video = 800 pixels * 0.04 us = 25.60 us
            H_back_porch(left border) = 48 * 0.04 us = 1.92 us 
            H_front_porch(right border) = 16 * 0.04 us = 0.64 us 
            H_sync (retrace) = 96 * 0.04 us = 3.84 us
            
            horizontal scan lines = H_sync + H_back_porch + H_front_porch + horizontal_video 
            (96+16+48+640) * 0.04 = (25.60 + 1.92 + 0.64 + 3.84 ) us
             32 us                = 32 us 
             
             
            pixel clk = 25 MHZ = 0.04 us 
            horizontal scan time = 32 us
            vertical_video = 480 pixels * 32 us = 15.360 ms
            V_back_porch(top border) = 33 * 32 us = 1.056 ms 
            V_front_porch(bottom border) = 10 * 32 us = 0.320 ms 
            V_sync (retrace) = 2 * 32 us = 0.064 ms
            
            vertical scan lines = H_sync + H_back_porch + H_front_porch + horizontal_video 
            (2+10+33+480) * 0.04 = (15.360 + 1.056 + 0.320 + 0.064 ) ms
             16.8ms                = 16.8 ms 

# RTL View
![Vga_rtl](https://user-images.githubusercontent.com/98607828/182015111-c091a7c7-4b76-4d77-b091-10e9bf0f2f70.jpg)



# Implemented & Synthesized Design

![vga_implemente_design](https://user-images.githubusercontent.com/98607828/182015129-5f48db8c-ecec-4b2f-a066-1569078c6910.jpg)

![vga_synthesized_design](https://user-images.githubusercontent.com/98607828/182015148-93909d09-e665-465a-afb8-df3ebed86fac.jpg)




# simulation Results

   Horizontal_Retrace
   
![Horizontal_retrace](https://user-images.githubusercontent.com/98607828/182015172-ccd5f825-44eb-44c2-84fb-15962b8a5626.jpg)

   Horizonatal_video_timing
   
![horizontal_video_timing](https://user-images.githubusercontent.com/98607828/182015207-e7c37acb-30f7-447e-93bc-faeab56514fd.jpg)

 Horizontal_video_scan_line
 
 ![Horizontal_scan_line](https://user-images.githubusercontent.com/98607828/182015668-e6986128-3e40-40e2-bfbc-cfcef7504b81.jpg)

 Vertical_Retrace
 
 ![V_synch__retrace](https://user-images.githubusercontent.com/98607828/182015218-49e95800-bbfa-477c-840f-70f216afcb8a.jpg)
 
 
 Vertical_video_scan_line
 
 ![vga_vertical_scan_line](https://user-images.githubusercontent.com/98607828/182015233-4d1d44db-b586-461c-9c53-67bf588bc025.jpg)

 Vertical_video_timing
 
 ![vertical_video_timing](https://user-images.githubusercontent.com/98607828/182015446-ecbd73e4-6427-4bba-81e9-f7a63d3e3303.jpg)

 Video_on_timing
 
  ![vid_on_vga](https://user-images.githubusercontent.com/98607828/182015266-fbc6578d-6e25-4973-b925-b985c9a09b65.jpg)

 Video_off_timing
 
![vid_off_bga](https://user-images.githubusercontent.com/98607828/182015274-1c324158-206f-4d0e-804d-cda7271edee9.jpg)



