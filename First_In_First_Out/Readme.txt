
 ---> This Verilog code for FIFO/Queue is full generalized.
 ---> This first version of FIFO/Queue hold the below properties:

 (1)  FIFO Depth Customization: 
      The provided Verilog code for the FIFO allows for customization of the FIFO depth. This can be achieved by setting the parameter value for “FIFO_Depth”. 
      This allows the user to define a FIFO of any depth, such as a 16-deep FIFO or a 64-deep FIFO.

 (2)  Data Width Customization: 
      The FIFO design also allows for data of any width to be stored. This is controlled by setting the parameter value for “Input_Data_Width”.

 (3)  Write/Read Signal Timing: 
      It is necessary to ensure that the write or read signals are asserted high at the positive edge of the clock. 
      This is a requirement for the synchronous operation of the FIFO.

 (4)  Data Input Timing: 
      When writing data into the FIFO, the data must be presented on the Data_in line simultaneously with the assertion of the write signal. 

 (5)  Write/Read for Multiple Clock Cycles: 
      If Write/Read signal remain high for more than one clock cycle this will count as a single Write/Read signal. 
      The FIFO deisgn will handle this automatically if Write/Read signal remain high for multiple clock cycles.
