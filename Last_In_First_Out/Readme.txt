
 ---> This Verilog code for LIFO/stack is full generalized.
 ---> This first version of LIFO/stack hold the below properties:

 (1)  LIFO Depth Customization: 
      The provided Verilog code for the LIFO allows for customization of the LIFO depth. This can be achieved by setting the parameter value for “LIFO_Depth”. 
      This allows the user to define a LIFO of any depth, such as a 16-deep LIFO or a 64-deep LIFO.

 (2)  Data Width Customization: 
      The LIFO design also allows for data of any width to be stored. This is controlled by setting the parameter value for “Input_Data_Width”.

 (3)  Write/Read Signal Timing: 
      It is necessary to ensure that the write or read signals are asserted high at the positive edge of the clock. 
      This is a requirement for the synchronous operation of the LIFO.

 (4)  Data Input Timing: 
      When writing data into the LIFO, the data must be presented on the Data_in line simultaneously with the assertion of the write signal. 

 (5)  Write/Read for Multiple Clock Cycles: 
      If Write/Read signal remain high for more than one clock cycle this will count as single Write/Read signal. 
      The LIFO deisgn will handle this automatically if Write/Read signal remain high for multiple clock cycles.
