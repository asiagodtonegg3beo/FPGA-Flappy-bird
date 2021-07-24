module flag_2(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [64:0] flag_2_r;
reg [64:0] flag_2_g;
reg [64:0] flag_2_b;
reg [16:0] flag_2_a;
parameter x_size = 16,y_size = 16;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{flag_2_r[4*ix+3],flag_2_r[4*ix+2],flag_2_r[4*ix+1],flag_2_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{flag_2_g[4*ix+3],flag_2_g[4*ix+2],flag_2_g[4*ix+1],flag_2_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{flag_2_b[4*ix+3],flag_2_b[4*ix+2],flag_2_b[4*ix+1],flag_2_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{flag_2_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[4:0])
5'd0:flag_2_r=64'h5555555555555555;
5'd1:flag_2_r=64'h5555555555555555;
5'd2:flag_2_r=64'h5555555555555555;
5'd3:flag_2_r=64'h5555555555555555;
5'd4:flag_2_r=64'h5555555555555555;
5'd5:flag_2_r=64'h5555555555555555;
5'd6:flag_2_r=64'h5555555555555555;
5'd7:flag_2_r=64'h5555555555555555;
5'd8:flag_2_r=64'h5555550000555555;
5'd9:flag_2_r=64'h5555508000055555;
5'd10:flag_2_r=64'h5555080000005555;
5'd11:flag_2_r=64'h5555080000005555;
5'd12:flag_2_r=64'h5555000000005555;
5'd13:flag_2_r=64'h5555000000005555;
5'd14:flag_2_r=64'h5555500000055555;
5'd15:flag_2_r=64'h5555550000555555;
endcase
case(iy[4:0])
5'd0:flag_2_g=64'h9999999999999999;
5'd1:flag_2_g=64'h9999999999999999;
5'd2:flag_2_g=64'h9999999999999999;
5'd3:flag_2_g=64'h9999999999999999;
5'd4:flag_2_g=64'h9999999999999999;
5'd5:flag_2_g=64'h9999999999999999;
5'd6:flag_2_g=64'h9999999999999999;
5'd7:flag_2_g=64'h9999999999999999;
5'd8:flag_2_g=64'h9999990000999999;
5'd9:flag_2_g=64'h999990daaa099999;
5'd10:flag_2_g=64'h99990daaaaa09999;
5'd11:flag_2_g=64'h99990daaaaa09999;
5'd12:flag_2_g=64'h99990aaaaaa09999;
5'd13:flag_2_g=64'h99990aaaaaa09999;
5'd14:flag_2_g=64'h999990aaaa099999;
5'd15:flag_2_g=64'h9999990000999999;
endcase
case(iy[4:0])
5'd0:flag_2_b=64'hffffffffffffffff;
5'd1:flag_2_b=64'hffffffffffffffff;
5'd2:flag_2_b=64'hffffffffffffffff;
5'd3:flag_2_b=64'hffffffffffffffff;
5'd4:flag_2_b=64'hffffffffffffffff;
5'd5:flag_2_b=64'hffffffffffffffff;
5'd6:flag_2_b=64'hffffffffffffffff;
5'd7:flag_2_b=64'hffffffffffffffff;
5'd8:flag_2_b=64'hffffff0000ffffff;
5'd9:flag_2_b=64'hfffff010000fffff;
5'd10:flag_2_b=64'hffff01000000ffff;
5'd11:flag_2_b=64'hffff01000000ffff;
5'd12:flag_2_b=64'hffff00000000ffff;
5'd13:flag_2_b=64'hffff00000000ffff;
5'd14:flag_2_b=64'hfffff000000fffff;
5'd15:flag_2_b=64'hffffff0000ffffff;
endcase
case(iy[4:0])
5'd0:flag_2_a=16'b1111111111111111;
5'd1:flag_2_a=16'b1111111111111111;
5'd2:flag_2_a=16'b1111111111111111;
5'd3:flag_2_a=16'b1111111111111111;
5'd4:flag_2_a=16'b1111111111111111;
5'd5:flag_2_a=16'b1111111111111111;
5'd6:flag_2_a=16'b1111111111111111;
5'd7:flag_2_a=16'b1111111111111111;
5'd8:flag_2_a=16'b1111111111111111;
5'd9:flag_2_a=16'b1111111111111111;
5'd10:flag_2_a=16'b1111111111111111;
5'd11:flag_2_a=16'b1111111111111111;
5'd12:flag_2_a=16'b1111111111111111;
5'd13:flag_2_a=16'b1111111111111111;
5'd14:flag_2_a=16'b1111111111111111;
5'd15:flag_2_a=16'b1111111111111111;
endcase
end
endmodule
