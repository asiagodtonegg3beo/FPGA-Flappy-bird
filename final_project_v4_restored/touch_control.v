module touch_control	 (	
	  iCLK,
	  iRSTN,
	  iREADY,
	  iREG_GESTURE,
	  ix1,
	  iy1,
	  ix2,
	  iy2,
	  itouch_count,
	  oButton_state
);

parameter	IDLE		             =	1'b0;
parameter	TOUCH		             =	1'b1;

//=======================================================
//  Port declarations
//=======================================================					
input		          iCLK;
input		          iRSTN;
input              iREADY;
input	      [7:0] iREG_GESTURE;
input	[9:0]	ix1;			// X coordinate form touch panel
input	[8:0]	iy1;			// Y coordinate form touch panel
input	[9:0]	ix2;			// X coordinate form touch panel
input	[8:0]	iy2;			// Y coordinate form touch panel
input	[1:0]	itouch_count;			
//output reg  [3:0] oY_MODE;
output [3:0] oButton_state;


//=======================================================
//  REG/WIRE declarations
//=======================================================
reg	         [9:0] temp;
reg 	   	   [2:0] ready_d;
reg                touch_state;
reg          [8:0] wait_count;
//wire               no_gesture_code;
//wire               zoom_code;
//reg                zoom, zoom_out;
//wire               zoom_reset, state_reset, set_trig;
//wire               y_mode_non_max, y_mode_non_min;


//=======================================================
//  Structural coding
//=======================================================
/*assign no_gesture_code = iREG_GESTURE==8'h0;
assign zoom_code = iREG_GESTURE[6:3]==4'b1001;
assign zoom_reset = iREADY&&no_gesture_code&&zoom;
assign state_reset = wait_count[8] || zoom_reset;
assign set_trig = touch_state && state_reset;
assign y_mode_non_max = &oY_MODE ? 1'b0 : 1'b1; 
assign y_mode_non_min = |oY_MODE ? 1'b1 : 1'b0;*/


assign right_btn = ((ix1>10'd700&&ix1<10'd800&&iy1>9'd400&&itouch_count!=0)||(ix2>10'd700&&ix2<10'd800&&iy2>9'd400&&itouch_count[1]))?1'b1:1'b0;
assign left_btn = ((ix1>10'd600&&ix1<10'd700&&iy1>9'd400&&itouch_count!=0)||(ix2>10'd600&&ix2<10'd700&&iy2>9'd400&&itouch_count[1]))?1'b1:1'b0;
assign up_btn = ((ix1>10'd0&&ix1<10'd100&&iy1>9'd400&&itouch_count!=0)||(ix2>10'd0&&ix2<10'd100&&iy2>9'd400&&itouch_count[1]))?1'b1:1'b0;
assign oButton_state = {1'b0,up_btn,left_btn,right_btn};

/*always@(posedge iCLK or negedge iRSTN)
begin
	if (!iRSTN)
	begin
		touch_state	<= 1'b0;
	end else if (temp != iX_COORD)
	begin
		touch_state	<= 1'b1;
	end else 
	begin
		touch_state	<= 1'b0;
	end
	
	temp <= iX_COORD;
end*/
/*always@(posedge iCLK or negedge iRSTN)
	if (!iRSTN)
	begin
		oY_MODE <= 4'b0;
	end
  else
  begin
  	if (set_trig && zoom)
  	begin
  		if (zoom_out)
  			oY_MODE <= oY_MODE - y_mode_non_min;
  	  else
  			oY_MODE <= oY_MODE + y_mode_non_max;
  	end
  end
*/


/*always@(posedge iCLK or negedge iRSTN)
	if (!iRSTN)
	begin
		ready_d <= 3'b0;
		touch_state	<= IDLE;
	end
  else
  begin 
  	ready_d <= {ready_d[1:0], iREADY};
	
		case (touch_state)
			IDLE : begin
				  if (!ready_d[2] && ready_d[1])
				  begin
 					  touch_state	<= TOUCH;
 					  wait_count <= 9'b0;
 					end
 					
			end
			TOUCH : 
			begin
				if (state_reset)
				begin
					touch_state	<= IDLE;
					wait_count <= 9'b0;
				end
						
				if (ready_d[2] && !ready_d[1])
				//if (!ready_d[2] && ready_d[1])
				begin
					wait_count <= 9'b0;
				end
				else
					wait_count <= wait_count + 9'b1;
         	
				//if (!ready_d[2] && ready_d[1])
				//begin
			 
				//end
			end
		endcase
  end*/
  
endmodule