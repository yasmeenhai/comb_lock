`timescale 1ns/1ps // Specifies the time unit and precision in the simulation
module COMB_LOCK_tb ;
 logic t_reset , t_status ;
 logic [15:0]t_in_code;

 COMB_LOCK F1 (t_reset ,t_in_code ,t_status );//correct password 1473

  initial begin  // Stimulus generation
    t_in_code = 16'h1273; //three wrong attempts 
    t_reset=0;

    #10 t_in_code = 16'h1483;
    #10 t_in_code = 16'h2473;
    #10 t_in_code = 16'h4667; 
    #10 t_in_code = 16'h1473;//correct passcode after 3 wrong attempts without reset 
    

    #10 t_in_code = 16'h1473;//correct passcode after 3 wrong attempts with reset 
    #10  t_reset = 1;
    #10 t_reset =0; 
    #10 t_in_code = 16'h1473;//correct password with the reset on
    #10 t_in_code = 16'h2189;//incorrect pasword    


  end
  initial begin 
    $monitor("t_in_code = %h ,t_reset = %d , t_status = %d ",t_in_code, t_reset ,t_status);
  end
  endmodule 