module hit_question_mark(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [64:0] hit_question_mark_r;
reg [64:0] hit_question_mark_g;
reg [64:0] hit_question_mark_b;
reg [16:0] hit_question_mark_a;
parameter x_size = 16,y_size = 16;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{hit_question_mark_r[4*ix+3],hit_question_mark_r[4*ix+2],hit_question_mark_r[4*ix+1],hit_question_mark_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{hit_question_mark_g[4*ix+3],hit_question_mark_g[4*ix+2],hit_question_mark_g[4*ix+1],hit_question_mark_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{hit_question_mark_b[4*ix+3],hit_question_mark_b[4*ix+2],hit_question_mark_b[4*ix+1],hit_question_mark_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{hit_question_mark_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[4:0])
5'd0:hit_question_mark_r=64'h5ccccdddddddccb3;
5'd1:hit_question_mark_r=64'hcffffffffffffee3;
5'd2:hit_question_mark_r=64'hce5efffffffff4d3;
5'd3:hit_question_mark_r=64'hcfeefffffffffde2;
5'd4:hit_question_mark_r=64'hcffffffffffffee2;
5'd5:hit_question_mark_r=64'hdfffffffffffffe2;
5'd6:hit_question_mark_r=64'hdffffffffffffed3;
5'd7:hit_question_mark_r=64'hdfffffffffffffe3;
5'd8:hit_question_mark_r=64'hdffffffffffffee3;
5'd9:hit_question_mark_r=64'hdfffffffffffffe3;
5'd10:hit_question_mark_r=64'hdffffffffffffee3;
5'd11:hit_question_mark_r=64'hdfffffffffffffe2;
5'd12:hit_question_mark_r=64'hcfeefffffffffee3;
5'd13:hit_question_mark_r=64'hce4defeeefffe3c2;
5'd14:hit_question_mark_r=64'hbecdeeeeeeeeecc1;
5'd15:hit_question_mark_r=64'h3332223333333210;
endcase
case(iy[4:0])
5'd0:hit_question_mark_g=64'h0566666565666760;
5'd1:hit_question_mark_g=64'h5999aa999999a9a0;
5'd2:hit_question_mark_g=64'h6809a9aa9aa99090;
5'd3:hit_question_mark_g=64'h6a89aaaaaa9aa9b0;
5'd4:hit_question_mark_g=64'h69aaaa9a9aaaaaa0;
5'd5:hit_question_mark_g=64'h69aaaaaaaaaaaba0;
5'd6:hit_question_mark_g=64'h59aaa9aaaaaaaaa0;
5'd7:hit_question_mark_g=64'h69aaaaaaaaaaaaa0;
5'd8:hit_question_mark_g=64'h699aaaaaaaaaaaa0;
5'd9:hit_question_mark_g=64'h6999aaaaaaaaaaa0;
5'd10:hit_question_mark_g=64'h59aaaa9aaaaaaaa0;
5'd11:hit_question_mark_g=64'h69aaaaaaaaaaaaa0;
5'd12:hit_question_mark_g=64'h6a9aaaaaaaaabaa0;
5'd13:hit_question_mark_g=64'h6909aaaaaaaaa090;
5'd14:hit_question_mark_g=64'h6a9aaaaaaaaaa9b0;
5'd15:hit_question_mark_g=64'h0000000000000000;
endcase
case(iy[4:0])
5'd0:hit_question_mark_b=64'h0111110000110230;
5'd1:hit_question_mark_b=64'h1544443444445470;
5'd2:hit_question_mark_b=64'h1304434444445060;
5'd3:hit_question_mark_b=64'h1545444444345570;
5'd4:hit_question_mark_b=64'h1444443444344570;
5'd5:hit_question_mark_b=64'h1443444444434560;
5'd6:hit_question_mark_b=64'h0444433344444560;
5'd7:hit_question_mark_b=64'h0344443334344560;
5'd8:hit_question_mark_b=64'h0445444343444560;
5'd9:hit_question_mark_b=64'h1444443434444560;
5'd10:hit_question_mark_b=64'h0444343443444470;
5'd11:hit_question_mark_b=64'h1444444444444560;
5'd12:hit_question_mark_b=64'h0555444444446660;
5'd13:hit_question_mark_b=64'h1505555555556060;
5'd14:hit_question_mark_b=64'h3757766666667690;
5'd15:hit_question_mark_b=64'h0000000000000000;
endcase
case(iy[4:0])
5'd0:hit_question_mark_a=16'b1111111111111111;
5'd1:hit_question_mark_a=16'b1111111111111111;
5'd2:hit_question_mark_a=16'b1111111111111111;
5'd3:hit_question_mark_a=16'b1111111111111111;
5'd4:hit_question_mark_a=16'b1111111111111111;
5'd5:hit_question_mark_a=16'b1111111111111111;
5'd6:hit_question_mark_a=16'b1111111111111111;
5'd7:hit_question_mark_a=16'b1111111111111111;
5'd8:hit_question_mark_a=16'b1111111111111111;
5'd9:hit_question_mark_a=16'b1111111111111111;
5'd10:hit_question_mark_a=16'b1111111111111111;
5'd11:hit_question_mark_a=16'b1111111111111111;
5'd12:hit_question_mark_a=16'b1111111111111111;
5'd13:hit_question_mark_a=16'b1111111111111111;
5'd14:hit_question_mark_a=16'b1111111111111111;
5'd15:hit_question_mark_a=16'b1111111111111111;
endcase
end
endmodule
