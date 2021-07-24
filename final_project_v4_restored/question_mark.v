module question_mark(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [64:0] question_mark_r;
reg [64:0] question_mark_g;
reg [64:0] question_mark_b;
reg [16:0] question_mark_a;
parameter x_size = 16,y_size = 16;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{question_mark_r[4*ix+3],question_mark_r[4*ix+2],question_mark_r[4*ix+1],question_mark_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{question_mark_g[4*ix+3],question_mark_g[4*ix+2],question_mark_g[4*ix+1],question_mark_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{question_mark_b[4*ix+3],question_mark_b[4*ix+2],question_mark_b[4*ix+1],question_mark_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{question_mark_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[4:0])
5'd0:question_mark_r=64'h4cdddddddedddca2;
5'd1:question_mark_r=64'hcfffffffffffffd2;
5'd2:question_mark_r=64'hdf4efffffffff4d2;
5'd3:question_mark_r=64'hdffffdccddfffdd3;
5'd4:question_mark_r=64'hcfffed445ccffee2;
5'd5:question_mark_r=64'hdfffdd4efcc5ffd2;
5'd6:question_mark_r=64'hefffcc4dfcc4ffd2;
5'd7:question_mark_r=64'hdffff55ecaa4ffd2;
5'd8:question_mark_r=64'hdffffffbb333ffd2;
5'd9:question_mark_r=64'hdffffffcb4deffe2;
5'd10:question_mark_r=64'heffffffe43efffe2;
5'd11:question_mark_r=64'heffffffcaeffffd2;
5'd12:question_mark_r=64'hcfeffffba3effee2;
5'd13:question_mark_r=64'hcf3dfffe33efe3d2;
5'd14:question_mark_r=64'haecedeeeccddecc1;
5'd15:question_mark_r=64'h3322233221222210;
endcase
case(iy[4:0])
5'd0:question_mark_g=64'h0666666666666660;
5'd1:question_mark_g=64'h69999a99999999a0;
5'd2:question_mark_g=64'h6909aa9a99aaa0a0;
5'd3:question_mark_g=64'h6aaa966666aaaaa0;
5'd4:question_mark_g=64'h6aa96600066aaaa0;
5'd5:question_mark_g=64'h6aaa56099660aaa0;
5'd6:question_mark_g=64'h69aa66099670aaa0;
5'd7:question_mark_g=64'h6aa9a0097560aaa0;
5'd8:question_mark_g=64'h6aaaaa966000aaa0;
5'd9:question_mark_g=64'h69aaaaa6609aaaa0;
5'd10:question_mark_g=64'h69aaaa9900aaa9a0;
5'd11:question_mark_g=64'h69aa9aa76aaa9a90;
5'd12:question_mark_g=64'h6a9aaaa660aaa9a0;
5'd13:question_mark_g=64'h6909aaaa00aa90a0;
5'd14:question_mark_g=64'h6a9baaaaaaaabaa0;
5'd15:question_mark_g=64'h0000000000000000;
endcase
case(iy[4:0])
5'd0:question_mark_b=64'h0221000001001230;
5'd1:question_mark_b=64'h2554343444334560;
5'd2:question_mark_b=64'h1404544554434060;
5'd3:question_mark_b=64'h0445412211445560;
5'd4:question_mark_b=64'h0444110001045560;
5'd5:question_mark_b=64'h1444020762204660;
5'd6:question_mark_b=64'h0244120762305560;
5'd7:question_mark_b=64'h0344500631304470;
5'd8:question_mark_b=64'h0444444220004460;
5'd9:question_mark_b=64'h0444344120664460;
5'd10:question_mark_b=64'h0444433400554460;
5'd11:question_mark_b=64'h1445434127544660;
5'd12:question_mark_b=64'h1556543030555570;
5'd13:question_mark_b=64'h2505654500665070;
5'd14:question_mark_b=64'h3667666777667680;
5'd15:question_mark_b=64'h0000000000000000;
endcase
case(iy[4:0])
5'd0:question_mark_a=16'b1111111111111111;
5'd1:question_mark_a=16'b1111111111111111;
5'd2:question_mark_a=16'b1111111111111111;
5'd3:question_mark_a=16'b1111111111111111;
5'd4:question_mark_a=16'b1111111111111111;
5'd5:question_mark_a=16'b1111111111111111;
5'd6:question_mark_a=16'b1111111111111111;
5'd7:question_mark_a=16'b1111111111111111;
5'd8:question_mark_a=16'b1111111111111111;
5'd9:question_mark_a=16'b1111111111111111;
5'd10:question_mark_a=16'b1111111111111111;
5'd11:question_mark_a=16'b1111111111111111;
5'd12:question_mark_a=16'b1111111111111111;
5'd13:question_mark_a=16'b1111111111111111;
5'd14:question_mark_a=16'b1111111111111111;
5'd15:question_mark_a=16'b1111111111111111;
endcase
end
endmodule
