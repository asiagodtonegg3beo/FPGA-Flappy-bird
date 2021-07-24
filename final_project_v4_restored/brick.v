module brick(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [64:0] brick_r;
reg [64:0] brick_g;
reg [64:0] brick_b;
reg [16:0] brick_a;
parameter x_size = 16,y_size = 16;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{brick_r[4*ix+3],brick_r[4*ix+2],brick_r[4*ix+1],brick_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{brick_g[4*ix+3],brick_g[4*ix+2],brick_g[4*ix+1],brick_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{brick_b[4*ix+3],brick_b[4*ix+2],brick_b[4*ix+1],brick_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{brick_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[4:0])
5'd0:brick_r=64'h9999999099999990;
5'd1:brick_r=64'h9999999099999990;
5'd2:brick_r=64'h9999999099999990;
5'd3:brick_r=64'h0000000000000000;
5'd4:brick_r=64'h9990999999909999;
5'd5:brick_r=64'h9990999999909999;
5'd6:brick_r=64'h9990999999909999;
5'd7:brick_r=64'h0000000000000000;
5'd8:brick_r=64'h9999999099999990;
5'd9:brick_r=64'h9999999099999990;
5'd10:brick_r=64'h9999999099999990;
5'd11:brick_r=64'h0000000000000000;
5'd12:brick_r=64'h9999099999909999;
5'd13:brick_r=64'h9999099999909999;
5'd14:brick_r=64'h9999099999909999;
5'd15:brick_r=64'h0000000000000000;
endcase
case(iy[4:0])
5'd0:brick_g=64'h4444444044444440;
5'd1:brick_g=64'h4444444044444440;
5'd2:brick_g=64'h4444444044444440;
5'd3:brick_g=64'h0000000000000000;
5'd4:brick_g=64'h4440444444404444;
5'd5:brick_g=64'h4440444444404444;
5'd6:brick_g=64'h4440444444404444;
5'd7:brick_g=64'h0000000000000000;
5'd8:brick_g=64'h4444444044444440;
5'd9:brick_g=64'h4444444044444440;
5'd10:brick_g=64'h4444444044444440;
5'd11:brick_g=64'h0000000000000000;
5'd12:brick_g=64'h4444044444404444;
5'd13:brick_g=64'h4444044444404444;
5'd14:brick_g=64'h4444044444404444;
5'd15:brick_g=64'h0000000000000000;
endcase
case(iy[4:0])
5'd0:brick_b=64'h0000000000000000;
5'd1:brick_b=64'h0000000000000000;
5'd2:brick_b=64'h0000000000000000;
5'd3:brick_b=64'h0000000000000000;
5'd4:brick_b=64'h0000000000000000;
5'd5:brick_b=64'h0000000000000000;
5'd6:brick_b=64'h0000000000000000;
5'd7:brick_b=64'h0000000000000000;
5'd8:brick_b=64'h0000000000000000;
5'd9:brick_b=64'h0000000000000000;
5'd10:brick_b=64'h0000000000000000;
5'd11:brick_b=64'h0000000000000000;
5'd12:brick_b=64'h0000000000000000;
5'd13:brick_b=64'h0000000000000000;
5'd14:brick_b=64'h0000000000000000;
5'd15:brick_b=64'h0000000000000000;
endcase
case(iy[4:0])
5'd0:brick_a=16'b1111111111111111;
5'd1:brick_a=16'b1111111111111111;
5'd2:brick_a=16'b1111111111111111;
5'd3:brick_a=16'b1111111111111111;
5'd4:brick_a=16'b1111111111111111;
5'd5:brick_a=16'b1111111111111111;
5'd6:brick_a=16'b1111111111111111;
5'd7:brick_a=16'b1111111111111111;
5'd8:brick_a=16'b1111111111111111;
5'd9:brick_a=16'b1111111111111111;
5'd10:brick_a=16'b1111111111111111;
5'd11:brick_a=16'b1111111111111111;
5'd12:brick_a=16'b1111111111111111;
5'd13:brick_a=16'b1111111111111111;
5'd14:brick_a=16'b1111111111111111;
5'd15:brick_a=16'b1111111111111111;
endcase
end
endmodule
