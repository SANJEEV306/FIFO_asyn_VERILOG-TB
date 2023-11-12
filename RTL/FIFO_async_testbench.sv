// Code your testbench here
// or browse Examples
module async_fifo_TB;

  parameter DATA_WIDTH = 8;

  wire [DATA_WIDTH-1:0] data_out;
  wire full;
  wire empty;
  reg [DATA_WIDTH-1:0] data_in;
  reg w_en, wclk, wrst_n;
  reg r_en, rclk, rrst_n;

  asynchronous_fifo as_fifo (wclk, wrst_n,rclk, rrst_n,w_en,r_en,data_in,data_out,full,empty);

  always #20 wclk = ~wclk;
  always #35 rclk = ~rclk;
  
  initial begin
    wclk = 1'b0; wrst_n = 1'b0;
    w_en = 1'b0;
    data_in = 0;
    
    repeat(10) @(posedge wclk);
    begin 
    wrst_n = 1'b1;

      for (int i=0; i<20; i++) begin
        @(posedge wclk iff !full);
        w_en = (i%2 == 0)? 1'b1 : 1'b0;
        if (w_en) 
          data_in = $urandom;
      end
      #50;
    end
  end

  initial 
    begin
    rclk = 1'b0; rrst_n = 1'b0;
    r_en = 1'b0;

    repeat(20) @(posedge rclk);
    rrst_n = 1'b1;

      for (int i=0; i<20; i++) begin
        @(posedge rclk iff !empty);
        r_en = (i%2 == 0)? 1'b1 : 1'b0;
        end
      #50 $finish;
  end
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
