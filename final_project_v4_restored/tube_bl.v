module tube_bl(ix,iy,oR,oG,oB,mask,clk);
input clk;
input [10:0] ix;
input [10:0] iy;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
reg [64:0] tube_bl_r;
reg [64:0] tube_bl_g;
reg [64:0] tube_bl_b;
reg [16:0] tube_bl_a;
parameter x_size = 16,y_size = 16;
wire mask;

assign oR = (ix<x_size&&iy<y_size)?{tube_bl_r[4*ix+3],tube_bl_r[4*ix+2],tube_bl_r[4*ix+1],tube_bl_r[4*ix],4'b0000}:{ix[7:0]};
assign oG = (ix<x_size&&iy<y_size)?{tube_bl_g[4*ix+3],tube_bl_g[4*ix+2],tube_bl_g[4*ix+1],tube_bl_g[4*ix],4'b0000}:{iy[7:0]};
assign oB = (ix<x_size&&iy<y_size)?{tube_bl_b[4*ix+3],tube_bl_b[4*ix+2],tube_bl_b[4*ix+1],tube_bl_b[4*ix],4'b0000}:{ix+iy}; 
assign mask = (ix<x_size&&iy<y_size)?{tube_bl_a[ix]}:0; 
always @(posedge clk)
begin
case(iy[4:0])
5'd0:tube_bl_r=64'h5508880088888088;
5'd1:tube_bl_r=64'h5508880088888088;
5'd2:tube_bl_r=64'h5508880088888088;
5'd3:tube_bl_r=64'h5508880088888088;
5'd4:tube_bl_r=64'h5508880088888088;
5'd5:tube_bl_r=64'h5508880088888088;
5'd6:tube_bl_r=64'h5508880088888088;
5'd7:tube_bl_r=64'h5508880088888088;
5'd8:tube_bl_r=64'h5508880088888088;
5'd9:tube_bl_r=64'h5508880088888088;
5'd10:tube_bl_r=64'h5508880088888088;
5'd11:tube_bl_r=64'h5508880088888088;
5'd12:tube_bl_r=64'h5508880088888088;
5'd13:tube_bl_r=64'h5508880088888088;
5'd14:tube_bl_r=64'h5508880088888088;
5'd15:tube_bl_r=64'h5508880088888088;
endcase
case(iy[4:0])
5'd0:tube_bl_g=64'h990dddaadddddadd;
5'd1:tube_bl_g=64'h990dddaadddddadd;
5'd2:tube_bl_g=64'h990dddaadddddadd;
5'd3:tube_bl_g=64'h990dddaadddddadd;
5'd4:tube_bl_g=64'h990dddaadddddadd;
5'd5:tube_bl_g=64'h990dddaadddddadd;
5'd6:tube_bl_g=64'h990dddaadddddadd;
5'd7:tube_bl_g=64'h990dddaadddddadd;
5'd8:tube_bl_g=64'h990dddaadddddadd;
5'd9:tube_bl_g=64'h990dddaadddddadd;
5'd10:tube_bl_g=64'h990dddaadddddadd;
5'd11:tube_bl_g=64'h990dddaadddddadd;
5'd12:tube_bl_g=64'h990dddaadddddadd;
5'd13:tube_bl_g=64'h990dddaadddddadd;
5'd14:tube_bl_g=64'h990dddaadddddadd;
5'd15:tube_bl_g=64'h990dddaadddddadd;
endcase
case(iy[4:0])
5'd0:tube_bl_b=64'hff01110011111011;
5'd1:tube_bl_b=64'hff01110011111011;
5'd2:tube_bl_b=64'hff01110011111011;
5'd3:tube_bl_b=64'hff01110011111011;
5'd4:tube_bl_b=64'hff01110011111011;
5'd5:tube_bl_b=64'hff01110011111011;
5'd6:tube_bl_b=64'hff01110011111011;
5'd7:tube_bl_b=64'hff01110011111011;
5'd8:tube_bl_b=64'hff01110011111011;
5'd9:tube_bl_b=64'hff01110011111011;
5'd10:tube_bl_b=64'hff01110011111011;
5'd11:tube_bl_b=64'hff01110011111011;
5'd12:tube_bl_b=64'hff01110011111011;
5'd13:tube_bl_b=64'hff01110011111011;
5'd14:tube_bl_b=64'hff01110011111011;
5'd15:tube_bl_b=64'hff01110011111011;
endcase
case(iy[4:0])
5'd0:tube_bl_a=16'b1111111111111111;
5'd1:tube_bl_a=16'b1111111111111111;
5'd2:tube_bl_a=16'b1111111111111111;
5'd3:tube_bl_a=16'b1111111111111111;
5'd4:tube_bl_a=16'b1111111111111111;
5'd5:tube_bl_a=16'b1111111111111111;
5'd6:tube_bl_a=16'b1111111111111111;
5'd7:tube_bl_a=16'b1111111111111111;
5'd8:tube_bl_a=16'b1111111111111111;
5'd9:tube_bl_a=16'b1111111111111111;
5'd10:tube_bl_a=16'b1111111111111111;
5'd11:tube_bl_a=16'b1111111111111111;
5'd12:tube_bl_a=16'b1111111111111111;
5'd13:tube_bl_a=16'b1111111111111111;
5'd14:tube_bl_a=16'b1111111111111111;
5'd15:tube_bl_a=16'b1111111111111111;
endcase
end
endmodule
