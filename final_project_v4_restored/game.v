module game(clk,slow_clk,iRST_N,iCoord_X,iCoord_Y,iBtn_state,oRed,oGreen,oBlue);

input clk;
input slow_clk;
input iRST_N;
input [12:0] iCoord_X;
input [10:0] iCoord_Y;
input [3:0] iBtn_state;
output [7:0] oRed;
output [7:0] oGreen;
output [7:0] oBlue;

reg [12:0] map_moveX,map_moveY;
reg [12:0] player_moveX,player_moveY;

wire [7:0] map_r,map_g,map_b;
wire [7:0] bottom_r,bottom_g,bottom_b,bottom_mask;
wire [7:0] mario_r,mario_g,mario_b,mario_mask;
wire [7:0] mario_big_r,mario_big_g,mario_big_b,mario_big_mask;

wire [10:0] center_index_x;
wire [3:0] center_index_y;
wire [12:0] map_ix,map_iy;
assign map_ix = iCoord_X+map_moveX;
assign map_iy = iCoord_Y;
map mymap(
.ix(map_ix), .iy(iCoord_Y),
.icoin(coin_state), 
.iquestion(question_signal), 
.map_index_x(center_index_x), .map_index_y(center_index_y), 
.oR(map_r), .oG(map_g), .oB(map_b), .clk(clk)
);

bottom_bar bottom(
.ix(iCoord_X), .iy(iCoord_Y), 
.oR(bottom_r), .oG(bottom_g), .oB(bottom_b),
.btn_state(iBtn_state), .mask(bottom_mask), .clk(clk)
);

wire [12:0] player_x,player_y;
reg direction;
assign player_x = direction?(-iCoord_X+player_moveX+26):-(-iCoord_X+player_moveX);
assign player_y = iCoord_Y-416+32+player_moveY;
mario player(.ix(player_x), .iy(player_y), .oR(mario_r), .oG(mario_g), .oB(mario_b), .mask(mario_mask), .clk(clk));
mario_big player_big(.ix(-iCoord_X+player_moveX+32), .iy(iCoord_Y-416+46+player_moveY), .oR(mario_big_r), .oG(mario_big_g), .oB(mario_big_b), .mask(mario_big_mask), .clk(clk));

wire [6:0] hitbox_state;
hitbox player_hitbox(.ix(player_moveX), .iy(player_moveY), .iw(7'd26), .ih(7'd32), .imap_x(map_moveX), .ostate(hitbox_state), .clk(clk));

assign coin_state = hitbox_state[4];
assign question_state = hitbox_state[5];


reg [12:0] question_moment_x,question_moment_y;//,moment_x,moment_y;
wire [10:0] texture_x, texture_y;
assign texture_x = (31-question_moment_x)/2;
assign texture_y = (question_moment_y)/2+32;

wire [7:0] coin_r,coin_g,coin_b,coin_mask;
coin coin_texture(.ix(texture_x),.iy(texture_y),.oR(coin_r),.oG(coin_g),.oB(coin_b),.mask(coin_mask),.clk(clk));

reg [2:0] up_edge;
reg up_signal;
reg [7:0] up_delay;
reg [5:0] coin_delay;
wire coin_state,question_state;
reg question_signal;




/*
reg [7:0] oRed;
reg [7:0] oGreen;
reg [7:0] oBlue;
*/


assign oRed = bottom_mask?bottom_r:
				  coin_mask?coin_r:
				  mario_mask?mario_r:
				  map_r;
assign oGreen = bottom_mask?bottom_g:
					 coin_mask?coin_g:
					 mario_mask?mario_g:
					 map_g;
assign oBlue = bottom_mask?bottom_b:
					coin_mask?coin_b:
					mario_mask?mario_b:
					map_b;



/*always @(posedge clk)
begin

if(iBtn_state[2])
begin
	oRed = mario_big_mask?mario_big_r:bottom_mask?bottom_r:map_r;
	oGreen = mario_big_mask?mario_big_g:bottom_mask?bottom_g:map_g;
	oBlue = mario_big_mask?mario_big_b:bottom_mask?bottom_b:map_b;
end
else
begin
	oRed = mario_mask?mario_r:bottom_mask?bottom_r:map_r;
	oGreen = mario_mask?mario_g:bottom_mask?bottom_g:map_g;
	oBlue = mario_mask?mario_b:bottom_mask?bottom_b:map_b;
end


end*/


initial
begin

end


always @(posedge slow_clk or negedge iRST_N)
begin

if(!iRST_N)
begin
	map_moveX <= 0;
	player_moveX <= 0;
	direction <= 1'b1;
end else if(1'b0)//???????????
begin
	map_moveX <= 0;
	player_moveX <= 0;
end else if(iBtn_state[0]&&hitbox_state[2]) // right
begin
	direction <= 1'b1;
	if(player_moveX < 300)
		player_moveX <= player_moveX + 1;
	else
		map_moveX <= map_moveX + 1;
end
else if(iBtn_state[1]&&player_moveX>0&&hitbox_state[3]) // left
begin
	direction <= 1'b0;
	player_moveX <= player_moveX - 1;
end
else
begin
	player_moveX <= player_moveX;
	map_moveX <= map_moveX;
end



if(!iRST_N)
begin
	player_moveY <= 64;
end else if(up_signal&&hitbox_state[0]) // up
begin
	player_moveY <= player_moveY + 1;
end else if(/*player_moveY>64 && */hitbox_state[1]) // gravity
begin
	player_moveY <= player_moveY - 1;
end else
begin
	player_moveY <= player_moveY;
end

end

always @(posedge slow_clk)
begin
if (!up_edge[2] && up_edge[1] && !hitbox_state[1])
begin
	up_signal <= 1'b1;
	up_delay <= 0;
end else if(up_delay > 150 || !hitbox_state[0] ||(up_edge == 3'b0))
begin
	up_signal <= 1'b0;
	up_delay <= 0;
end else
begin
	up_delay <= up_delay + 1'b1;
end

up_edge <= {up_edge[1:0],iBtn_state[2]};
end

always @(posedge slow_clk or negedge iRST_N)
begin

if(!iRST_N)
begin
	question_signal <= 1'b0;
end else if(question_state)
begin
	question_signal <= 1'b1;
	coin_delay <= 0;
end else if(question_signal)
begin
	if(coin_delay < 50)
		coin_delay <= coin_delay + 1;
end else
begin
	question_signal <= question_signal;
	coin_delay <= 63;
end 

end

always @(posedge clk or negedge iRST_N)
begin

if(!iRST_N)
begin
	question_moment_x <= question_moment_x;
	question_moment_y <= question_moment_y;
end else if(question_state||coin_delay < 50)
begin
	question_moment_x <= player_x;
	question_moment_y <= player_y;//-player_moveY;
end else
begin
	question_moment_x <= question_moment_x;
	question_moment_y <= question_moment_y;
end

end
endmodule