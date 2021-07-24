module bottom_bar(ix,iy,oR,oG,oB,btn_state,mask,clk);

input clk;
input [10:0] ix;
input [10:0] iy;
input [3:0] btn_state;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output mask;
wire [7:0] bar_r;
wire [7:0] bar_g;
wire [7:0] bar_b;
wire mask;


assign oR = bar_r;
assign oG = bar_g;
assign oB = bar_b;

wire right_mask;
wire left_mask;
wire top_mask;
arrow right(.ix(772-ix),.iy(iy-416),.mask(right_mask),.clk(clk));// -(ix-718)+64
arrow left(.ix(ix-618),.iy(iy-416),.mask(left_mask),.clk(clk));
arrow top(.ix(iy-416),.iy(ix-018),.mask(top_mask),.clk(clk));

assign mask = iy>416?1'b1:1'b0;
assign right_c = (right_mask&&btn_state[0]);
assign left_c = (left_mask&&btn_state[1]);
assign top_c = (top_mask&&btn_state[2]);
assign bar_r = (right_c||left_c||top_c)?8'hee:(right_mask||left_mask||top_mask)?8'h88:8'h00;
assign bar_g = (right_c||left_c||top_c)?8'hee:(right_mask||left_mask||top_mask)?8'h88:8'h00;
assign bar_b = (right_c||left_c||top_c)?8'hee:(right_mask||left_mask||top_mask)?8'h88:8'h00;
parameter padding = 10;
assign h_condition = iy>416+padding&&iy<480-padding;
assign btn_right = ix>700+padding&&ix<800-padding;
assign btn_left = ix>600+padding&&ix<700-padding;
assign btn_up = ix>0+padding&&ix<100-padding;


endmodule