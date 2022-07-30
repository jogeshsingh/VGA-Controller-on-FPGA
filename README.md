# VGA-Controller-on-FPGA
  vga vertical scan line 
              
  # Horizontal Timing
                                                  one_Horizontal_scan 
                                                      (800)
                                  ________________________________________________________________
                         H_back_porch                                H_Front_porch        H_back_porch  
                            (48)                                        (16)                (48)        
         _________           _____|_____________________________________|____             ______|__
                  |_________|     |                                     |    |___________|      |
                    H_sync        start              H_disp             end       H_sync
                     (96)         143              (640)                783         (96)
                    
 
 
 
 
 
 # Vertical Timing
       
           V_back_porch                          V_front_porch
           (33)                                   (10)
    ____    ___|_________________________________|____    ______
        |__|   |                                 |    |__|
       V_sync  |             Vdisp               |     V_sync
        (2)    |             (480)               |      (2)
               (35)                             (512)
