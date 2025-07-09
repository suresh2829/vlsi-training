module single_port_sync_ram_tb;
  parameter ADDR_WIDTH = 4;
  parameter DATA_WIDTH = 16;
  parameter DEPTH = 16;

  reg clk;
  reg cs;
  reg we;
  reg oe;
  reg [ADDR_WIDTH-1:0] addr;
  wire [DATA_WIDTH-1:0] data;
  reg [DATA_WIDTH-1:0] tb_data;
  integer i;

  single_port_sync_ram #(.DATA_WIDTH(DATA_WIDTH)) u0
  ( 	                    .clk(clk),
                        	.addr(addr),
                        	.data(data),
                        	.cs(cs),
   							.we(we),
   							.oe(oe)
                         );



  always@(posedge clk) begin
  clk='b0;
  
  #10 clk = ~clk;
  end
  assign data = !oe ? tb_data : 'hz;

  initial begin
    {clk, cs, we, addr, tb_data, oe} <= 0;

    repeat (2) @ (posedge clk);

    for (i = 0; i < 2**ADDR_WIDTH; i= i+1) begin
      repeat (1) @(posedge clk) addr <= i; we <= 1; cs <=1; oe <= 0; tb_data <= $random;
    end

    for (i = 0; i < 2**ADDR_WIDTH; i= i+1) begin
      repeat (1) @(posedge clk) addr <= i; we <= 0; cs <= 1; oe <= 1;
    end

    #20 $finish;
  end
endmodule