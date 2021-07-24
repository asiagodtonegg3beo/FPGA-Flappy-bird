module grass_3(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [64:0] grass_3_r;
reg [64:0] grass_3_g;
reg [64:0] grass_3_b;
reg [16:0] grass_3_a;
parameter x_size = 16,y_size = 16;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{grass_3_r[4*ix+3],grass_3_r[4*ix+2],grass_3_r[4*ix+1],grass_3_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{grass_3_g[4*ix+3],grass_3_g[4*ix+2],grass_3_g[4*ix+1],grass_3_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{grass_3_b[4*ix+3],grass_3_b[4*ix+2],grass_3_b[4*ix+1],grass_3_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{grass_3_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[4:0])
5'd0:grass_3_r=64'h5555555555555555;
5'd1:grass_3_r=64'h5555555555555555;
5'd2:grass_3_r=64'h5555555555555555;
5'd3:grass_3_r=64'h5555555555555555;
5'd4:grass_3_r=64'h5555555555555555;
5'd5:grass_3_r=64'h0555555555555555;
5'd6:grass_3_r=64'h0555555555555555;
5'd7:grass_3_r=64'h0555555555555555;
5'd8:grass_3_r=64'h8055055555555555;
5'd9:grass_3_r=64'h8050805555555555;
5'd10:grass_3_r=64'h8808805555555555;
5'd11:grass_3_r=64'h8888805055555555;
5'd12:grass_3_r=64'h8888880805555555;
5'd13:grass_3_r=64'h8888888805555555;
5'd14:grass_3_r=64'h8888888805555555;
5'd15:grass_3_r=64'h8888888055555555;
endcase
case(iy[4:0])
5'd0:grass_3_g=64'h9999999999999999;
5'd1:grass_3_g=64'h9999999999999999;
5'd2:grass_3_g=64'h9999999999999999;
5'd3:grass_3_g=64'h9999999999999999;
5'd4:grass_3_g=64'h9999999999999999;
5'd5:grass_3_g=64'h0999999999999999;
5'd6:grass_3_g=64'h0999999999999999;
5'd7:grass_3_g=64'h0999999999999999;
5'd8:grass_3_g=64'hd099099999999999;
5'd9:grass_3_g=64'hd090d09999999999;
5'd10:grass_3_g=64'hdd0dd09999999999;
5'd11:grass_3_g=64'hddddd09099999999;
5'd12:grass_3_g=64'hdddddd0d09999999;
5'd13:grass_3_g=64'hdddddddd09999999;
5'd14:grass_3_g=64'hdddddddd09999999;
5'd15:grass_3_g=64'hddddddd099999999;
endcase
case(iy[4:0])
5'd0:grass_3_b=64'hffffffffffffffff;
5'd1:grass_3_b=64'hffffffffffffffff;
5'd2:grass_3_b=64'hffffffffffffffff;
5'd3:grass_3_b=64'hffffffffffffffff;
5'd4:grass_3_b=64'hffffffffffffffff;
5'd5:grass_3_b=64'h0fffffffffffffff;
5'd6:grass_3_b=64'h0fffffffffffffff;
5'd7:grass_3_b=64'h0fffffffffffffff;
5'd8:grass_3_b=64'h10ff0fffffffffff;
5'd9:grass_3_b=64'h10f010ffffffffff;
5'd10:grass_3_b=64'h110110ffffffffff;
5'd11:grass_3_b=64'h111110f0ffffffff;
5'd12:grass_3_b=64'h111111010fffffff;
5'd13:grass_3_b=64'h111111110fffffff;
5'd14:grass_3_b=64'h111111110fffffff;
5'd15:grass_3_b=64'h11111110ffffffff;
endcase
case(iy[4:0])
5'd0:grass_3_a=16'b1111111111111111;
5'd1:grass_3_a=16'b1111111111111111;
5'd2:grass_3_a=16'b1111111111111111;
5'd3:grass_3_a=16'b1111111111111111;
5'd4:grass_3_a=16'b1111111111111111;
5'd5:grass_3_a=16'b1111111111111111;
5'd6:grass_3_a=16'b1111111111111111;
5'd7:grass_3_a=16'b1111111111111111;
5'd8:grass_3_a=16'b1111111111111111;
5'd9:grass_3_a=16'b1111111111111111;
5'd10:grass_3_a=16'b1111111111111111;
5'd11:grass_3_a=16'b1111111111111111;
5'd12:grass_3_a=16'b1111111111111111;
5'd13:grass_3_a=16'b1111111111111111;
5'd14:grass_3_a=16'b1111111111111111;
5'd15:grass_3_a=16'b1111111111111111;
endcase
end
endmodule
