module ground(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [64:0] ground_r;
reg [64:0] ground_g;
reg [64:0] ground_b;
reg [16:0] ground_a;
parameter x_size = 16,y_size = 16;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{ground_r[4*ix+3],ground_r[4*ix+2],ground_r[4*ix+1],ground_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{ground_g[4*ix+3],ground_g[4*ix+2],ground_g[4*ix+1],ground_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{ground_b[4*ix+3],ground_b[4*ix+2],ground_b[4*ix+1],ground_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{ground_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[4:0])
5'd0:ground_r=64'heffffffff0effffe;
5'd1:ground_r=64'hfeeeeeeee0feeee0;
5'd2:ground_r=64'hfeeeeeeee0feeee0;
5'd3:ground_r=64'hfeeeeeeee0feeee0;
5'd4:ground_r=64'hfeeeeeeee0f0eee0;
5'd5:ground_r=64'hfeeeeeeee0e0000e;
5'd6:ground_r=64'hfeeeeeeee0fffff0;
5'd7:ground_r=64'hfeeeeeeee0feeee0;
5'd8:ground_r=64'hfeeeeeeee0feeee0;
5'd9:ground_r=64'hfeeeeeeee0feeee0;
5'd10:ground_r=64'h00eeeeee0feeeee0;
5'd11:ground_r=64'hff00eeee0feeeee0;
5'd12:ground_r=64'hfeff0000feeeeee0;
5'd13:ground_r=64'hfeeefff0feeeeee0;
5'd14:ground_r=64'hfeeeeee0feeeee00;
5'd15:ground_r=64'he000000ef000000e;
endcase
case(iy[4:0])
5'd0:ground_g=64'h5dddddddd05dddd5;
5'd1:ground_g=64'hd555555550d55550;
5'd2:ground_g=64'hd555555550d55550;
5'd3:ground_g=64'hd555555550d55550;
5'd4:ground_g=64'hd555555550d05550;
5'd5:ground_g=64'hd555555550500005;
5'd6:ground_g=64'hd555555550ddddd0;
5'd7:ground_g=64'hd555555550d55550;
5'd8:ground_g=64'hd555555550d55550;
5'd9:ground_g=64'hd555555550d55550;
5'd10:ground_g=64'h005555550d555550;
5'd11:ground_g=64'hdd0055550d555550;
5'd12:ground_g=64'hd5dd0000d5555550;
5'd13:ground_g=64'hd555ddd0d5555550;
5'd14:ground_g=64'hd5555550d5555500;
5'd15:ground_g=64'h50000005d0000005;
endcase
case(iy[4:0])
5'd0:ground_b=64'h1bbbbbbbb01bbbb1;
5'd1:ground_b=64'hb111111110b11110;
5'd2:ground_b=64'hb111111110b11110;
5'd3:ground_b=64'hb111111110b11110;
5'd4:ground_b=64'hb111111110b01110;
5'd5:ground_b=64'hb111111110100001;
5'd6:ground_b=64'hb111111110bbbbb0;
5'd7:ground_b=64'hb111111110b11110;
5'd8:ground_b=64'hb111111110b11110;
5'd9:ground_b=64'hb111111110b11110;
5'd10:ground_b=64'h001111110b111110;
5'd11:ground_b=64'hbb0011110b111110;
5'd12:ground_b=64'hb1bb0000b1111110;
5'd13:ground_b=64'hb111bbb0b1111110;
5'd14:ground_b=64'hb1111110b1111100;
5'd15:ground_b=64'h10000001b0000001;
endcase
case(iy[4:0])
5'd0:ground_a=16'b1111111111111111;
5'd1:ground_a=16'b1111111111111111;
5'd2:ground_a=16'b1111111111111111;
5'd3:ground_a=16'b1111111111111111;
5'd4:ground_a=16'b1111111111111111;
5'd5:ground_a=16'b1111111111111111;
5'd6:ground_a=16'b1111111111111111;
5'd7:ground_a=16'b1111111111111111;
5'd8:ground_a=16'b1111111111111111;
5'd9:ground_a=16'b1111111111111111;
5'd10:ground_a=16'b1111111111111111;
5'd11:ground_a=16'b1111111111111111;
5'd12:ground_a=16'b1111111111111111;
5'd13:ground_a=16'b1111111111111111;
5'd14:ground_a=16'b1111111111111111;
5'd15:ground_a=16'b1111111111111111;
endcase
end
endmodule
