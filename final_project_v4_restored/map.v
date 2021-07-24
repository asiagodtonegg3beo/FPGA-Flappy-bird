module map(ix,iy,icoin,iquestion,map_index_x,map_index_y,oR,oG,oB,oBlock_style,clk);
input clk;
input [12:0] ix;
input [10:0] iy;
input icoin;
input iquestion;
output [7:0] oR;
output [7:0] oG;
output [7:0] oB;
output [7:0] oBlock_style;
output [10:0] map_index_x;
output [3:0] map_index_y;
assign oBlock_style = map_state;
parameter map_x_length = 876;

reg [map_x_length-1:0] map;
wire [10:0] texture_x,texture_y;
wire [3:0] map_state;


assign texture_x = ((31-ix)%32)/2;
assign texture_y = ((iy)%32)/2;
//assign map_index_x = map_x_length-4*(ix/32+1);
assign map_index_x = map_x_length-4*(ix/32+2);
assign map_index_y = iy[8:5];
assign map_state = {map[map_index_x+3],map[map_index_x+2],map[map_index_x+1],map[map_index_x]};

wire [7:0] ground_r,ground_g,ground_b,ground_mask;
wire [7:0] block_r,block_g,block_b,block_mask;
wire [7:0] brick_r,brick_g,brick_b,brick_mask;
wire [7:0] question_mark_r,question_mark_g,question_mark_b,question_mark_mask;
wire [7:0] hit_question_mark_r,hit_question_mark_g,hit_question_mark_b,hit_question_mark_mask;

ground ground_texture(.ix(texture_x),.iy(texture_y),.oR(ground_r),.oG(ground_g),.oB(ground_b),.mask(ground_mask),.clk(clk));
block block_texture(.ix(texture_x),.iy(texture_y),.oR(block_r),.oG(block_g),.oB(block_b),.mask(block_mask),.clk(clk));
brick brick_texture(.ix(texture_x),.iy(texture_y),.oR(brick_r),.oG(brick_g),.oB(brick_b),.mask(brick_mask),.clk(clk));
question_mark question_mark_texture(.ix(texture_x),.iy(texture_y),.oR(question_mark_r),.oG(question_mark_g),.oB(question_mark_b),.mask(question_mark_mask),.clk(clk));
hit_question_mark hit_question_mark_texture(.ix(texture_x),.iy(texture_y),.oR(hit_question_mark_r),.oG(hit_question_mark_g),.oB(hit_question_mark_b),.mask(hit_question_mark_mask),.clk(clk));

wire [7:0] tube_bl_r,tube_bl_g,tube_bl_b,tube_bl_mask;
wire [7:0] tube_br_r,tube_br_g,tube_br_b,tube_br_mask;
wire [7:0] tube_tl_r,tube_tl_g,tube_tl_b,tube_tl_mask;
wire [7:0] tube_tr_r,tube_tr_g,tube_tr_b,tube_tr_mask;
tube_bl tube_bl_texture(.ix(texture_x),.iy(texture_y),.oR(tube_bl_r),.oG(tube_bl_g),.oB(tube_bl_b),.mask(tube_bl_mask),.clk(clk));
tube_br tube_br_texture(.ix(texture_x),.iy(texture_y),.oR(tube_br_r),.oG(tube_br_g),.oB(tube_br_b),.mask(tube_br_mask),.clk(clk));
tube_tl tube_tl_texture(.ix(texture_x),.iy(texture_y),.oR(tube_tl_r),.oG(tube_tl_g),.oB(tube_tl_b),.mask(tube_tl_mask),.clk(clk));
tube_tr tube_tr_texture(.ix(texture_x),.iy(texture_y),.oR(tube_tr_r),.oG(tube_tr_g),.oB(tube_tr_b),.mask(tube_tr_mask),.clk(clk));

wire [7:0] coin_r,coin_g,coin_b,coin_mask;
coin coin_texture(.ix(texture_x),.iy(texture_y),.oR(coin_r),.oG(coin_g),.oB(coin_b),.mask(coin_mask),.clk(clk));

wire [7:0] grass_1_r,grass_1_g,grass_1_b,grass_1_mask;
wire [7:0] grass_2_r,grass_2_g,grass_2_b,grass_2_mask;
wire [7:0] grass_3_r,grass_3_g,grass_3_b,grass_3_mask;
grass_1 grass_1_texture(.ix(texture_x),.iy(texture_y),.oR(grass_1_r),.oG(grass_1_g),.oB(grass_1_b),.mask(grass_1_mask),.clk(clk));
grass_2 grass_2_texture(.ix(texture_x),.iy(texture_y),.oR(grass_2_r),.oG(grass_2_g),.oB(grass_2_b),.mask(grass_2_mask),.clk(clk));
grass_3 grass_3_texture(.ix(texture_x),.iy(texture_y),.oR(grass_3_r),.oG(grass_3_g),.oB(grass_3_b),.mask(grass_3_mask),.clk(clk));

wire [7:0] flag_1_r,flag_1_g,flag_1_b,flag_1_mask;
wire [7:0] flag_2_r,flag_2_g,flag_2_b,flag_2_mask;
flag_1 flag_1_texture(.ix(texture_x),.iy(texture_y),.oR(flag_1_r),.oG(flag_1_g),.oB(flag_1_b),.mask(flag_1_mask),.clk(clk));
flag_2 flag_2_texture(.ix(texture_x),.iy(texture_y),.oR(flag_2_r),.oG(flag_2_g),.oB(flag_2_b),.mask(flag_2_mask),.clk(clk));

reg [7:0] oR,oG,oB;

wire question_signal;
assign question_signal = iquestion;

//assign oRed = img3_mask?img3_r:img2_mask?img2_r:img1_r;
//assign oGreen = img3_mask?img3_g:img2_mask?img2_g:img1_g;
//assign oBlue = img3_mask?img3_b:img2_mask?img2_b:img1_b;

always @(posedge clk)
begin

case(map_state)
4'h0://air
begin
oR = 8'h50;
oG = 8'h90;
oB = 8'hf0;
end

4'h1:
begin
oR = ground_r;
oG = ground_g;
oB = ground_b;
end

4'h2:
begin
oR = block_r;
oG = block_g;
oB = block_b;
end

4'h3:
begin
oR = brick_r;
oG = brick_g;
oB = brick_b;
end

4'h4:
begin

oR = question_signal?hit_question_mark_r:question_mark_r;
oG = question_signal?hit_question_mark_g:question_mark_g;
oB = question_signal?hit_question_mark_b:question_mark_b;
/*
oR = hit_question_mark_r;
oG = hit_question_mark_g;
oB = hit_question_mark_b;
*/

end

4'h5:
begin
oR = hit_question_mark_r;
oG = hit_question_mark_g;
oB = hit_question_mark_b;
end

4'h6:
begin
oR = tube_bl_r;
oG = tube_bl_g;
oB = tube_bl_b;
end
4'h7:
begin
oR = tube_br_r;
oG = tube_br_g;
oB = tube_br_b;
end
4'h8:
begin
oR = tube_tl_r;
oG = tube_tl_g;
oB = tube_tl_b;
end
4'h9:
begin
oR = tube_tr_r;
oG = tube_tr_g;
oB = tube_tr_b;
end

4'ha:
begin
oR = icoin?8'h50:coin_mask?coin_r:8'h50;
oG = icoin?8'h90:coin_mask?coin_g:8'h90;
oB = icoin?8'hf0:coin_mask?coin_b:8'hf0;
end

4'hb:// grass1
begin
oR = grass_1_r;
oG = grass_1_g;
oB = grass_1_b;
end
4'hc:// grass2
begin
oR = grass_2_r;
oG = grass_2_g;
oB = grass_2_b;
end
4'hd:// grass3
begin
oR = grass_3_r;
oG = grass_3_g;
oB = grass_3_b;
end

4'he:// flag1
begin
oR = flag_1_r;
oG = flag_1_g;
oB = flag_1_b;
end

4'hf:// flag2
begin
oR = flag_2_r;
oG = flag_2_g;
oB = flag_2_b;
end
endcase
end

always @(posedge clk)
begin
case(map_index_y)
4'h0:map = 876'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f000000000000000000;
4'h1:map = 876'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e000000000000000000;
4'h2:map = 876'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e000000000000000000;
4'h3:map = 876'h0000000000000000000004000000000000000000000000000000000000000000000000000000000333333330003334000000000000004000000000003330000344300000000000000000000000000000000000000000000000000000000002200000000e000000000000000000;
4'h4:map = 876'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000022200000000e000000000000000000;
4'h5:map = 876'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000222200000000e000000000000000000;
4'h6:map = 876'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002222200000000e000000000000000000;
4'h7:map = 876'h0000000000000004000343430000000000000aa0000008900000000089000000000000000000343000000000000003000003000004004004000003000000000033000000200200000000000220020000000000000334300000000000022222200000000e000000000000000000;
4'h8:map = 876'h000000000000000000000000000aa00000000890000006700000000067000000000000000000000000000000000000000000000000000000000000000000000000000002200220000000002220022000000000000000000000000000222222200000000e000000000000000000;
4'h9:map = 876'h0000000000000000000000000008900000000670000006700000000067000000000000000000000000000000000000000000000000000000000000000000000000000022200222000000022220022200000089000000000000008902222222200000000e000000000000000000;
4'ha:map = 876'h0000000000bcccd0000000bcd006700000000670bccd06700000000067bcccd0000000bcd0000000000000000000bccd0000000000bcccd00000000bcd000000000002222cc22220000022222002222d00006700bcd00000000067222222222000000002000000000000000000;
4'hb:map = 876'h11111111111111111111111111111111111111111111111111111111111111111111001111111111111111111000111111111111111111111111111111111111111111111111111111111111100111111111111111111111111111111111111111111111111111111111111111;
4'hc:map = 876'h11111111111111111111111111111111111111111111111111111111111111111111001111111111111111111000111111111111111111111111111111111111111111111111111111111111100111111111111111111111111111111111111111111111111111111111111111;
endcase
end


endmodule