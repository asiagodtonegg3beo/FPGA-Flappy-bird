module hitbox(ix,iy,iw,ih,imap_x,ostate,clk);

input [12:0] ix;
input [10:0] iy;
input [6:0] iw;
input [6:0] ih;
input [12:0] imap_x;
input clk;
output [6:0] ostate;
parameter block_size = 32;

/*assign top_x = ix+iw/2;
assign top_y = iy;

assign bottom_x = ix+iw/2;
assign bottom_y = iy+ih;

assign left_x = ix;
assign left_y = iy+ih/2;

assign right_x = ix+iw;
assign right_y = iy+ih/2;*/

wire [3:0] top_style,down_style,left_style,right_style,inside_style;

wire [12:0] center_x,down_y,top_y;
wire [12:0] center_y,left_x,right_x;

assign center_x = ix+iw/2+imap_x;
assign down_y = -iy+416;
assign top_y = down_y-ih;

assign center_y = -iy+416-ih/2;
assign left_x = ix+imap_x+iw;
assign right_x = ix+imap_x;


assign top_air = (top_style==4'h0||top_style>4'h9)?1'b1:1'b0;
assign down_air = (down_style==4'h0||down_style>4'h9)?1'b1:1'b0;
assign left_air = (left_style==4'h0||left_style>4'h9)?1'b1:1'b0;
assign right_air = (right_style==4'h0||right_style>4'h9)?1'b1:1'b0;

assign top_question_mark = (top_style==4'h4)?1'b1:1'b0;
assign inside_coin = (inside_style==4'ha)?1'b1:1'b0;


assign ostate = {top_question_mark,inside_coin,right_air,left_air,down_air,top_air};


map top(.ix(center_x), .iy(top_y),  .oBlock_style(top_style), .clk(clk));

map down(.ix(center_x), .iy(down_y),  .oBlock_style(down_style), .clk(clk));

map left(.ix(left_x), .iy(center_y),  .oBlock_style(left_style), .clk(clk));

map right(.ix(right_x), .iy(center_y),  .oBlock_style(right_style), .clk(clk));

map inside(.ix(center_x), .iy(center_y),  .oBlock_style(inside_style), .clk(clk));


endmodule