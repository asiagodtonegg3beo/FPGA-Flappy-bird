module tube_br(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [64:0] tube_br_r;
reg [64:0] tube_br_g;
reg [64:0] tube_br_b;
reg [16:0] tube_br_a;
parameter x_size = 16,y_size = 16;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{tube_br_r[4*ix+3],tube_br_r[4*ix+2],tube_br_r[4*ix+1],tube_br_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{tube_br_g[4*ix+3],tube_br_g[4*ix+2],tube_br_g[4*ix+1],tube_br_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{tube_br_b[4*ix+3],tube_br_b[4*ix+2],tube_br_b[4*ix+1],tube_br_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{tube_br_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[4:0])
5'd0:tube_br_r=64'h0000000080888055;
5'd1:tube_br_r=64'h0000000008088055;
5'd2:tube_br_r=64'h0000000080888055;
5'd3:tube_br_r=64'h0000000008088055;
5'd4:tube_br_r=64'h0000000080888055;
5'd5:tube_br_r=64'h0000000008088055;
5'd6:tube_br_r=64'h0000000080888055;
5'd7:tube_br_r=64'h0000000008088055;
5'd8:tube_br_r=64'h0000000080888055;
5'd9:tube_br_r=64'h0000000008088055;
5'd10:tube_br_r=64'h0000000080888055;
5'd11:tube_br_r=64'h0000000008088055;
5'd12:tube_br_r=64'h0000000080888055;
5'd13:tube_br_r=64'h0000000008088055;
5'd14:tube_br_r=64'h0000000080888055;
5'd15:tube_br_r=64'h0000000008088055;
endcase
case(iy[4:0])
5'd0:tube_br_g=64'haaaaaaaadaddd099;
5'd1:tube_br_g=64'haaaaaaaaadadd099;
5'd2:tube_br_g=64'haaaaaaaadaddd099;
5'd3:tube_br_g=64'haaaaaaaaadadd099;
5'd4:tube_br_g=64'haaaaaaaadaddd099;
5'd5:tube_br_g=64'haaaaaaaaadadd099;
5'd6:tube_br_g=64'haaaaaaaadaddd099;
5'd7:tube_br_g=64'haaaaaaaaadadd099;
5'd8:tube_br_g=64'haaaaaaaadaddd099;
5'd9:tube_br_g=64'haaaaaaaaadadd099;
5'd10:tube_br_g=64'haaaaaaaadaddd099;
5'd11:tube_br_g=64'haaaaaaaaadadd099;
5'd12:tube_br_g=64'haaaaaaaadaddd099;
5'd13:tube_br_g=64'haaaaaaaaadadd099;
5'd14:tube_br_g=64'haaaaaaaadaddd099;
5'd15:tube_br_g=64'haaaaaaaaadadd099;
endcase
case(iy[4:0])
5'd0:tube_br_b=64'h00000000101110ff;
5'd1:tube_br_b=64'h00000000010110ff;
5'd2:tube_br_b=64'h00000000101110ff;
5'd3:tube_br_b=64'h00000000010110ff;
5'd4:tube_br_b=64'h00000000101110ff;
5'd5:tube_br_b=64'h00000000010110ff;
5'd6:tube_br_b=64'h00000000101110ff;
5'd7:tube_br_b=64'h00000000010110ff;
5'd8:tube_br_b=64'h00000000101110ff;
5'd9:tube_br_b=64'h00000000010110ff;
5'd10:tube_br_b=64'h00000000101110ff;
5'd11:tube_br_b=64'h00000000010110ff;
5'd12:tube_br_b=64'h00000000101110ff;
5'd13:tube_br_b=64'h00000000010110ff;
5'd14:tube_br_b=64'h00000000101110ff;
5'd15:tube_br_b=64'h00000000010110ff;
endcase
case(iy[4:0])
5'd0:tube_br_a=16'b1111111111111111;
5'd1:tube_br_a=16'b1111111111111111;
5'd2:tube_br_a=16'b1111111111111111;
5'd3:tube_br_a=16'b1111111111111111;
5'd4:tube_br_a=16'b1111111111111111;
5'd5:tube_br_a=16'b1111111111111111;
5'd6:tube_br_a=16'b1111111111111111;
5'd7:tube_br_a=16'b1111111111111111;
5'd8:tube_br_a=16'b1111111111111111;
5'd9:tube_br_a=16'b1111111111111111;
5'd10:tube_br_a=16'b1111111111111111;
5'd11:tube_br_a=16'b1111111111111111;
5'd12:tube_br_a=16'b1111111111111111;
5'd13:tube_br_a=16'b1111111111111111;
5'd14:tube_br_a=16'b1111111111111111;
5'd15:tube_br_a=16'b1111111111111111;
endcase
end
endmodule
