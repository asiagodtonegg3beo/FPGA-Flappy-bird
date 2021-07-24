module block(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [64:0] block_r;
reg [64:0] block_g;
reg [64:0] block_b;
reg [16:0] block_a;
parameter x_size = 16,y_size = 16;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{block_r[4*ix+3],block_r[4*ix+2],block_r[4*ix+1],block_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{block_g[4*ix+3],block_g[4*ix+2],block_g[4*ix+1],block_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{block_b[4*ix+3],block_b[4*ix+2],block_b[4*ix+1],block_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{block_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[4:0])
5'd0:block_r=64'hdeeeeeeeeeeeeee1;
5'd1:block_r=64'hedeeeeeeeeeeee11;
5'd2:block_r=64'heedeeeeeeeeee111;
5'd3:block_r=64'heeedeeeeeeee1111;
5'd4:block_r=64'heeeedddddddd1111;
5'd5:block_r=64'heeeedddddddd1111;
5'd6:block_r=64'heeeedddddddd1111;
5'd7:block_r=64'heeeedddddddd1111;
5'd8:block_r=64'heeeedddddddd1111;
5'd9:block_r=64'heeeedddddddd1111;
5'd10:block_r=64'heeeedddddddd1111;
5'd11:block_r=64'heeeedddddddd1111;
5'd12:block_r=64'heee111111111d111;
5'd13:block_r=64'hee11111111111d11;
5'd14:block_r=64'he1111111111111d1;
5'd15:block_r=64'h111111111111111d;
endcase
case(iy[4:0])
5'd0:block_g=64'h6cccccccccccccc1;
5'd1:block_g=64'hc6cccccccccccc11;
5'd2:block_g=64'hcc6cccccccccc111;
5'd3:block_g=64'hccc6cccccccc1111;
5'd4:block_g=64'hcccc666666661111;
5'd5:block_g=64'hcccc666666661111;
5'd6:block_g=64'hcccc666666661111;
5'd7:block_g=64'hcccc666666661111;
5'd8:block_g=64'hcccc666666661111;
5'd9:block_g=64'hcccc666666661111;
5'd10:block_g=64'hcccc666666661111;
5'd11:block_g=64'hcccc666666661111;
5'd12:block_g=64'hccc1111111116111;
5'd13:block_g=64'hcc11111111111611;
5'd14:block_g=64'hc111111111111161;
5'd15:block_g=64'h1111111111111116;
endcase
case(iy[4:0])
5'd0:block_b=64'h1bbbbbbbbbbbbbb1;
5'd1:block_b=64'hb1bbbbbbbbbbbb11;
5'd2:block_b=64'hbb1bbbbbbbbbb111;
5'd3:block_b=64'hbbb1bbbbbbbb1111;
5'd4:block_b=64'hbbbb111111111111;
5'd5:block_b=64'hbbbb111111111111;
5'd6:block_b=64'hbbbb111111111111;
5'd7:block_b=64'hbbbb111111111111;
5'd8:block_b=64'hbbbb111111111111;
5'd9:block_b=64'hbbbb111111111111;
5'd10:block_b=64'hbbbb111111111111;
5'd11:block_b=64'hbbbb111111111111;
5'd12:block_b=64'hbbb1111111111111;
5'd13:block_b=64'hbb11111111111111;
5'd14:block_b=64'hb111111111111111;
5'd15:block_b=64'h1111111111111111;
endcase
case(iy[4:0])
5'd0:block_a=16'b1111111111111111;
5'd1:block_a=16'b1111111111111111;
5'd2:block_a=16'b1111111111111111;
5'd3:block_a=16'b1111111111111111;
5'd4:block_a=16'b1111111111111111;
5'd5:block_a=16'b1111111111111111;
5'd6:block_a=16'b1111111111111111;
5'd7:block_a=16'b1111111111111111;
5'd8:block_a=16'b1111111111111111;
5'd9:block_a=16'b1111111111111111;
5'd10:block_a=16'b1111111111111111;
5'd11:block_a=16'b1111111111111111;
5'd12:block_a=16'b1111111111111111;
5'd13:block_a=16'b1111111111111111;
5'd14:block_a=16'b1111111111111111;
5'd15:block_a=16'b1111111111111111;
endcase
end
endmodule
