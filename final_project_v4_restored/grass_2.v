module grass_2(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [64:0] grass_2_r;
reg [64:0] grass_2_g;
reg [64:0] grass_2_b;
reg [16:0] grass_2_a;
parameter x_size = 16,y_size = 16;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{grass_2_r[4*ix+3],grass_2_r[4*ix+2],grass_2_r[4*ix+1],grass_2_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{grass_2_g[4*ix+3],grass_2_g[4*ix+2],grass_2_g[4*ix+1],grass_2_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{grass_2_b[4*ix+3],grass_2_b[4*ix+2],grass_2_b[4*ix+1],grass_2_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{grass_2_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[4:0])
5'd0:grass_2_r=64'h5555555000055555;
5'd1:grass_2_r=64'h5555550888805555;
5'd2:grass_2_r=64'h5555008888880555;
5'd3:grass_2_r=64'h5550888888880505;
5'd4:grass_2_r=64'h5550888888888080;
5'd5:grass_2_r=64'h5550888888088888;
5'd6:grass_2_r=64'h5508880088808888;
5'd7:grass_2_r=64'h5088808888888888;
5'd8:grass_2_r=64'h0888888888888888;
5'd9:grass_2_r=64'h8888888888888888;
5'd10:grass_2_r=64'h8888888888888888;
5'd11:grass_2_r=64'h8888888888888888;
5'd12:grass_2_r=64'h8888888888888888;
5'd13:grass_2_r=64'h8888888888888888;
5'd14:grass_2_r=64'h8888888888888888;
5'd15:grass_2_r=64'h8888888888888888;
endcase
case(iy[4:0])
5'd0:grass_2_g=64'h9999999000099999;
5'd1:grass_2_g=64'h9999990dddd09999;
5'd2:grass_2_g=64'h999900dddddd0999;
5'd3:grass_2_g=64'h9990dddddddd0909;
5'd4:grass_2_g=64'h9990ddddddddd0d0;
5'd5:grass_2_g=64'h9990ddddddaddddd;
5'd6:grass_2_g=64'h990dddaadddadddd;
5'd7:grass_2_g=64'h90dddadddddddddd;
5'd8:grass_2_g=64'h0ddddddddddddddd;
5'd9:grass_2_g=64'hdddddddddddddddd;
5'd10:grass_2_g=64'hdddddddddddddddd;
5'd11:grass_2_g=64'hdddddddddddddddd;
5'd12:grass_2_g=64'hdddddddddddddddd;
5'd13:grass_2_g=64'hdddddddddddddddd;
5'd14:grass_2_g=64'hdddddddddddddddd;
5'd15:grass_2_g=64'hdddddddddddddddd;
endcase
case(iy[4:0])
5'd0:grass_2_b=64'hfffffff0000fffff;
5'd1:grass_2_b=64'hffffff011110ffff;
5'd2:grass_2_b=64'hffff001111110fff;
5'd3:grass_2_b=64'hfff0111111110f0f;
5'd4:grass_2_b=64'hfff0111111111010;
5'd5:grass_2_b=64'hfff0111111011111;
5'd6:grass_2_b=64'hff01110011101111;
5'd7:grass_2_b=64'hf011101111111111;
5'd8:grass_2_b=64'h0111111111111111;
5'd9:grass_2_b=64'h1111111111111111;
5'd10:grass_2_b=64'h1111111111111111;
5'd11:grass_2_b=64'h1111111111111111;
5'd12:grass_2_b=64'h1111111111111111;
5'd13:grass_2_b=64'h1111111111111111;
5'd14:grass_2_b=64'h1111111111111111;
5'd15:grass_2_b=64'h1111111111111111;
endcase
case(iy[4:0])
5'd0:grass_2_a=16'b1111111111111111;
5'd1:grass_2_a=16'b1111111111111111;
5'd2:grass_2_a=16'b1111111111111111;
5'd3:grass_2_a=16'b1111111111111111;
5'd4:grass_2_a=16'b1111111111111111;
5'd5:grass_2_a=16'b1111111111111111;
5'd6:grass_2_a=16'b1111111111111111;
5'd7:grass_2_a=16'b1111111111111111;
5'd8:grass_2_a=16'b1111111111111111;
5'd9:grass_2_a=16'b1111111111111111;
5'd10:grass_2_a=16'b1111111111111111;
5'd11:grass_2_a=16'b1111111111111111;
5'd12:grass_2_a=16'b1111111111111111;
5'd13:grass_2_a=16'b1111111111111111;
5'd14:grass_2_a=16'b1111111111111111;
5'd15:grass_2_a=16'b1111111111111111;
endcase
end
endmodule
