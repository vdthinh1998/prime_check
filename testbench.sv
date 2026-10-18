//-------------------------------------------------------------------------
//				www.verificationguide.com   testbench.sv
//-------------------------------------------------------------------------
//---------------------------------------------------------------

module tbench_top;

  //---------------------------------------
  //clock and reset signal declaration
  //---------------------------------------
  bit clk;
  bit reset;
  integer input_number;
  bit prime;

  //---------------------------------------
  //clock generation
  //---------------------------------------
  always #5 clk = ~clk;
  
  //---------------------------------------
  //reset Generation
  //---------------------------------------
  initial begin
    reset = 1;
    #5 reset =0;
  end
  
  //---------------------------------------
  //DUT instance
  //---------------------------------------
  prime_check DUT (
    .clk(clk),
    .resetn(reset),
    .input_number(input_number),
    .prime(prime)
   );
  
  initial begin 
    input_number = 1;
    #10;
    $display("prime = %d", prime);
    input_number = 3;
    #10;
    $display("prime = %d", prime);
    input_number = 119;
    #10;
    $display("prime = %d", prime);
    input_number = 113;
    #10;
    $display("prime = %d", prime);
    input_number = 9;
    #10;
    $display("prime = %d", prime);
    $stop;
  end

endmodule