module tb;
  
  bit [3:0] a,b;
  bit [4:0] y;
  bit clk =0;
  always #10 clk=~clk;
  task add ();
    y = a + b;
    $display ("The value of| a : %0d | b : %0d | y = %0d",a,b,y);
  endtask
  
  task stimulation();
    @(posedge clk);
    a = $urandom();
    b = $urandom ();
    add();
  endtask
  
  initial begin
    #110;
    $finish(); 
  end
    
  initial begin
    for (int i =0 ; i < 11 ; i++) begin
      stimulation(); 
    end
  end
endmodule