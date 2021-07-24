module coin(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [64:0] coin_r;
reg [64:0] coin_g;
reg [64:0] coin_b;
reg [16:0] coin_a;
parameter x_size = 16,y_size = 16;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{coin_r[4*ix+3],coin_r[4*ix+2],coin_r[4*ix+1],coin_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{coin_g[4*ix+3],coin_g[4*ix+2],coin_g[4*ix+1],coin_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{coin_b[4*ix+3],coin_b[4*ix+2],coin_b[4*ix+1],coin_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{coin_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[4:0])
5'd0:coin_r=64'h0000000000000000;
5'd1:coin_r=64'h000000ffff000000;
5'd2:coin_r=64'h0000fffffffd0000;
5'd3:coin_r=64'h0000fffffffd0000;
5'd4:coin_r=64'h000ffffff0ffd000;
5'd5:coin_r=64'h000ffffff0ffd000;
5'd6:coin_r=64'h000ffffff0ffd000;
5'd7:coin_r=64'h000ffffff0ffd000;
5'd8:coin_r=64'h000ffffff0ffd000;
5'd9:coin_r=64'h000ffffff0ffd000;
5'd10:coin_r=64'h000ffffff0ffd000;
5'd11:coin_r=64'h000ffffff0ffd000;
5'd12:coin_r=64'h0000fff00ffd0000;
5'd13:coin_r=64'h0000ffffffdd0000;
5'd14:coin_r=64'h000000dddd000000;
5'd15:coin_r=64'h0000000000000000;
endcase
case(iy[4:0])
5'd0:coin_g=64'h0000000000000000;
5'd1:coin_g=64'h000000ffff000000;
5'd2:coin_g=64'h0000ffddddd90000;
5'd3:coin_g=64'h0000fdffffd90000;
5'd4:coin_g=64'h000fdfffd0fd9000;
5'd5:coin_g=64'h000fdfffd0fd9000;
5'd6:coin_g=64'h000fdfffd0fd9000;
5'd7:coin_g=64'h000fdfffd0fd9000;
5'd8:coin_g=64'h000fdfffd0fd9000;
5'd9:coin_g=64'h000fdfffd0fd9000;
5'd10:coin_g=64'h000fdffdd0fd9000;
5'd11:coin_g=64'h000fdffdd0fd9000;
5'd12:coin_g=64'h0000dff00fd90000;
5'd13:coin_g=64'h0000dddddd990000;
5'd14:coin_g=64'h0000009999000000;
5'd15:coin_g=64'h0000000000000000;
endcase
case(iy[4:0])
5'd0:coin_b=64'h0000000000000000;
5'd1:coin_b=64'h000000ffff000000;
5'd2:coin_b=64'h0000ff2221130000;
5'd3:coin_b=64'h0000f20ff0130000;
5'd4:coin_b=64'h000f20f010013000;
5'd5:coin_b=64'h000f10f010013000;
5'd6:coin_b=64'h000f10f010013000;
5'd7:coin_b=64'h000f10f010013000;
5'd8:coin_b=64'h000f10f010013000;
5'd9:coin_b=64'h000f10f010013000;
5'd10:coin_b=64'h000f10f110013000;
5'd11:coin_b=64'h000f10f110013000;
5'd12:coin_b=64'h0000100000130000;
5'd13:coin_b=64'h0000111111330000;
5'd14:coin_b=64'h0000003333000000;
5'd15:coin_b=64'h0000000000000000;
endcase
case(iy[4:0])
5'd0:coin_a=16'b0000001111000000;
5'd1:coin_a=16'b0000111111110000;
5'd2:coin_a=16'b0001111111111000;
5'd3:coin_a=16'b0001111111111000;
5'd4:coin_a=16'b0011111111111100;
5'd5:coin_a=16'b0011111111111100;
5'd6:coin_a=16'b0011111111111100;
5'd7:coin_a=16'b0011111111111100;
5'd8:coin_a=16'b0011111111111100;
5'd9:coin_a=16'b0011111111111100;
5'd10:coin_a=16'b0011111111111100;
5'd11:coin_a=16'b0011111111111100;
5'd12:coin_a=16'b0001111111111000;
5'd13:coin_a=16'b0001111111111000;
5'd14:coin_a=16'b0000111111110000;
5'd15:coin_a=16'b0000001111000000;
endcase
end
endmodule
