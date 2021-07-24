module	ping_pong(iclk,iRST_N,iCursor_X,iCursor_Y,iCoord_X,iCoord_Y,
                	oRed,	oGreen,	oBlue	);
parameter x_total=800;
parameter y_total=480;
parameter up_key_x=150;
parameter up_key_y=90;

input iclk;
input iRST_N;
input [10:0] iCursor_X,iCursor_Y;
input [10:0] iCoord_X,iCoord_Y;
output	[7:0]	oRed, oGreen,oBlue;
reg [7:0]	oRed, oGreen,oBlue;
integer board_width=80;
integer board_height=5;
integer ball_size=8;
integer move_x=x_total/2;
integer move_y=y_total/2;
integer dx=1;
integer dy=1;

always @(posedge iclk   )
begin
if (move_x>(x_total-1))
dx=-1;
else 
begin

if
(move_x<=0)
dx=1;
end
end

always @(posedge iclk)
begin
  if (move_y>=(y_total-1))
   dy=-1;
  else 
   begin
    if
    (move_y>=0 && move_y<=board_height  && iCursor_X<=move_x && move_x<=iCursor_X+board_width)
     dy=+1;
   end
end

always@(posedge iclk or negedge iRST_N)
begin
if(!iRST_N)
	begin
		move_x	<=	x_total/2;
		move_y	<=	y_total/2;
	end
else
begin
move_x<=move_x+dx;
move_y<=move_y+dy;
end
end



always@(iCursor_X,iCursor_Y,iCoord_X,iCoord_Y or ball_size or move_x or move_y )
begin

           if (move_x<iCoord_X && iCoord_X<move_x+ball_size &&move_y<iCoord_Y && iCoord_Y<move_y+ball_size ||
               iCursor_X<iCoord_X && iCoord_X<iCursor_X+board_width &&iCursor_Y<iCoord_Y && iCoord_Y< iCursor_Y+board_height
               ||   0<iCoord_X &&iCoord_X< up_key_x && iCoord_Y<y_total &&iCoord_Y>y_total-up_key_y ||   
                    iCoord_X>x_total-up_key_x &&iCoord_X< x_total && iCoord_Y<y_total &&iCoord_Y>y_total-up_key_y )
              begin
                oRed<=10'b011111111;
           //     oGreen<=10'b0111111111-iCoord_Y;
			  oGreen<=10'b0111111111;
           //    oBlue<=10'b011111111-iCoord_X;
			   oBlue<=10'b011111111;
               end
           else 
               begin
            //    oRed<=10'b1111111111;
				      oRed<=10'b0000000000;
                oGreen<=10'b0000000000;
               oBlue<=10'b0000000000;
               end



end



endmodule
