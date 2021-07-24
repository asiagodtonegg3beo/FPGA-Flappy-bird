module grass_1(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [64:0] grass_1_r;
reg [64:0] grass_1_g;
reg [64:0] grass_1_b;
reg [16:0] grass_1_a;
parameter x_size = 16,y_size = 16;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{grass_1_r[4*ix+3],grass_1_r[4*ix+2],grass_1_r[4*ix+1],grass_1_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{grass_1_g[4*ix+3],grass_1_g[4*ix+2],grass_1_g[4*ix+1],grass_1_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{grass_1_b[4*ix+3],grass_1_b[4*ix+2],grass_1_b[4*ix+1],grass_1_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{grass_1_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[4:0])
5'd0:grass_1_r=64'h5555555555555555;
5'd1:grass_1_r=64'h5555555555555555;
5'd2:grass_1_r=64'h5555555555555555;
5'd3:grass_1_r=64'h5555555555555555;
5'd4:grass_1_r=64'h5555555555555555;
5'd5:grass_1_r=64'h5555555555555555;
5'd6:grass_1_r=64'h5555555555555555;
5'd7:grass_1_r=64'h5555555555555555;
5'd8:grass_1_r=64'h5555555555555500;
5'd9:grass_1_r=64'h5555555555555088;
5'd10:grass_1_r=64'h5555555555550888;
5'd11:grass_1_r=64'h5555555555558888;
5'd12:grass_1_r=64'h5555555555008888;
5'd13:grass_1_r=64'h5555555550888888;
5'd14:grass_1_r=64'h5555555550888888;
5'd15:grass_1_r=64'h5555555555088888;
endcase
case(iy[4:0])
5'd0:grass_1_g=64'h9999999999999999;
5'd1:grass_1_g=64'h9999999999999999;
5'd2:grass_1_g=64'h9999999999999999;
5'd3:grass_1_g=64'h9999999999999999;
5'd4:grass_1_g=64'h9999999999999999;
5'd5:grass_1_g=64'h9999999999999999;
5'd6:grass_1_g=64'h9999999999999999;
5'd7:grass_1_g=64'h9999999999999999;
5'd8:grass_1_g=64'h9999999999999900;
5'd9:grass_1_g=64'h99999999999990dd;
5'd10:grass_1_g=64'h9999999999990ddd;
5'd11:grass_1_g=64'h999999999999dddd;
5'd12:grass_1_g=64'h999999999900dddd;
5'd13:grass_1_g=64'h9999999990dddddd;
5'd14:grass_1_g=64'h9999999990dddddd;
5'd15:grass_1_g=64'h99999999990ddddd;
endcase
case(iy[4:0])
5'd0:grass_1_b=64'hffffffffffffffff;
5'd1:grass_1_b=64'hffffffffffffffff;
5'd2:grass_1_b=64'hffffffffffffffff;
5'd3:grass_1_b=64'hffffffffffffffff;
5'd4:grass_1_b=64'hffffffffffffffff;
5'd5:grass_1_b=64'hffffffffffffffff;
5'd6:grass_1_b=64'hffffffffffffffff;
5'd7:grass_1_b=64'hffffffffffffffff;
5'd8:grass_1_b=64'hffffffffffffff00;
5'd9:grass_1_b=64'hfffffffffffff011;
5'd10:grass_1_b=64'hffffffffffff0111;
5'd11:grass_1_b=64'hffffffffffff1111;
5'd12:grass_1_b=64'hffffffffff001111;
5'd13:grass_1_b=64'hfffffffff0111111;
5'd14:grass_1_b=64'hfffffffff0111111;
5'd15:grass_1_b=64'hffffffffff011111;
endcase
case(iy[4:0])
5'd0:grass_1_a=16'b1111111111111111;
5'd1:grass_1_a=16'b1111111111111111;
5'd2:grass_1_a=16'b1111111111111111;
5'd3:grass_1_a=16'b1111111111111111;
5'd4:grass_1_a=16'b1111111111111111;
5'd5:grass_1_a=16'b1111111111111111;
5'd6:grass_1_a=16'b1111111111111111;
5'd7:grass_1_a=16'b1111111111111111;
5'd8:grass_1_a=16'b1111111111111111;
5'd9:grass_1_a=16'b1111111111111111;
5'd10:grass_1_a=16'b1111111111111111;
5'd11:grass_1_a=16'b1111111111111111;
5'd12:grass_1_a=16'b1111111111111111;
5'd13:grass_1_a=16'b1111111111111111;
5'd14:grass_1_a=16'b1111111111111111;
5'd15:grass_1_a=16'b1111111111111111;
endcase
end
endmodule
