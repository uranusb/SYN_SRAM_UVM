module SRAM(clk, rst, addr, wr_en, din, dout);
  input clk, rst;
  input [4:0] addr;
  input [15:0] din;
  input wr_en;
  output reg [15:0] dout;
  
  reg [15:0] memory[32:0];
  
  always@(posedge clk)begin
    if (rst == 1'b1)
      for(int i = 0; i < 32; i ++)
        memory[i] = 16'h0000;
    else begin
      if(wr_en == 1'b1)begin
        memory[addr] <= din;
      end
      else begin
        dout <= memory[addr];
      end
    end
  end

endmodule


