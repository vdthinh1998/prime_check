//------------------------------------------------------------------------
//				Memory Model RTL - www.verificationguide.com
//------------------------------------------------------------------------
/*
              -----------------
              |               |
    addr ---->|               |
              |               |------> rdata
              | Memory Model  |
   wdata ---->|               |
              |               | 
              -----------------
                   ^     ^
                   |     |
                wr_en  rd_en

-------------------------------------------------------------------------- */
module prime_check(
    input clk,
    input resetn,

    //data signals
    input  integer input_number,
    output logic prime
  ); 
  
  always @(posedge clk or negedge resetn)
    if(resetn) prime = 0;
  else begin 
    if(input_number == 0 || input_number == 1) prime =0;
    if(input_number == 3) prime = 1;
    for(int i=2;i<input_number/2+1;i++)
      if(input_number%i == 0) begin 
        prime = 0;
        break;
      end
      else prime = 1; 
  end

endmodule