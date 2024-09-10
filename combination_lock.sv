module  COMB_LOCK(input logic reset ,[15:0]in_code,output logic status  );

    logic [15:0]preset_code = 16'b 0001010001110011; //pasword : 1473 
    int count = 0; // track number of attempts 
   
    always_comb 
    begin 
     status = 0 ;
        if (reset) 
       begin 
        count = 0 ; status = 0 ; 
       end 
       else if (count > 2) status = 0; 
       else 
        begin 
                count++;
                if (preset_code == in_code) status = 1; //unlock
                else status = 0 ; //locked 
        
        end 
         
    end
endmodule 