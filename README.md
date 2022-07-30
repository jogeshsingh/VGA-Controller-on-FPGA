# VGA-Controller-on-FPGA
 # Introduction

              
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
