# FIFO_asyn_VERILOG-TB
Design an asynhronous FIFO with wr_clk (for writeoperation), rd_clk (for read operation), rst, data_I, data_o, wr_valid,rd_valid, fifo_full, fifo_empty, error ports.

What is FIFO?
  FIFO stands for frist in frist out. The data which came frist get out of queue first(Eg: Queue in tacet counter).

What is Asynchronous FIFO?
  * Aysnchronous FIFO use different clock to write data(input) and read data(ouput).
  * Aysnchronous FIFO use transfer data between to module those having different clock
