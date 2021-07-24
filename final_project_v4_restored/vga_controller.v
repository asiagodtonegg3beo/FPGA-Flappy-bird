module	vga_controller	(	
		//	Control Signal
		iCLK,
		iRSTN,	
		iR,
		iG,
		iB,
		oREAD,
		oVGA_R,
		oVGA_G,
		oVGA_B,
		oVGA_HS,
		oVGA_VS,
		oHCOUNT,
		oCoord_X,
		oCoord_Y

);
output [10:0] oCoord_X,oCoord_Y;						
//	Control Signal
input				     iCLK;
input				     iRSTN;	
input		   [7:0] iR;
input		   [7:0] iG;
input		   [7:0] iB;
output           oREAD;
output     [7:0] oVGA_R;
output     [7:0] oVGA_G;
output     [7:0] oVGA_B;
output reg 			 oVGA_HS;
output reg 			 oVGA_VS;
output    [10:0] oHCOUNT;


////////////////////////////////////////////////////////////
//	Horizontal	Parameter
parameter	H_TOTAL	 =	1055; // total-1 : 1056-1
parameter	H_SYNC	 =	29;  // sync-1 : 30-1
parameter	H_START  =	45;  // sync+back-1 : 30+16-1
parameter	H_END	   =	845; // H_START+800 : 45+800
//	Vertical Parameter
parameter	V_TOTAL	 =	524; // total-1 : 525-1
parameter	V_SYNC	 =	12;  // sync-1 : 13-1
parameter	V_START	 =	22;  // sync+back-1 : 13+10-1
parameter	V_END	   =	502; // V_START+480 : 22+480
////////////////////////////////////////////////////////////

reg			  [10:0]	h_count;
reg			  [9:0]	  v_count;
reg               h_act;
reg               v_act;
wire              h_max, hs_end, hr_start, hr_end;
wire              v_max, vs_end, vr_start, vr_end;

//=======================================================
//  Structural coding
//=======================================================
assign oVGA_R = iR;
assign oVGA_G = iG;
assign oVGA_B = iB;		    
assign oREAD = v_act && h_act;
assign oHCOUNT = h_count;

assign h_max = h_count == H_TOTAL;
assign hs_end = h_count >= H_SYNC;
assign hr_start = h_count == H_START; 
assign hr_end = h_count == H_END;
assign v_max = v_count == V_TOTAL;
assign vs_end = v_count >= V_SYNC;
assign vr_start = v_count == V_START; 
assign vr_end = v_count == V_END;
///////////////////////////////////////
reg [10:0]   oCoord_X,oCoord_Y;
 reg	[19:0]	oAddress;
always@(posedge iCLK or negedge iRSTN)
begin
	if(!iRSTN)
	begin
		oCoord_X	<=	0;
		oCoord_Y	<=	0;
	//	oAddress	<=	0;
	end
	else
	begin
		if((h_count>(H_START-1)&& //>215
						(h_count<(H_END))&& //< 1016
						(v_count>(V_START-1))&& 
						(v_count<(V_END))
						))
		begin
			oCoord_X	<=	h_count-(H_START-1);
			oCoord_Y	<=	v_count-(V_START-1);
	//		oAddress	<=	oCoord_Y*(H_TOTAL- 45 )+oCoord_X-3;
		end
	end
end
////////////////////////////////////////////////////////////

always @ (posedge iCLK or negedge iRSTN)
	if (!iRSTN)
	begin
		h_count		<=	11'b0;
		oVGA_HS		<=	1'b1;
		h_act	    <=	1'b0;
	end
	else
	begin
    if (h_max)
		  h_count	<=	11'b0;
		else
		  h_count	<= h_count + 11'b1;

		if (hs_end && !h_max)
		  oVGA_HS	<=	1'b1;
		else
		  oVGA_HS	<= 1'b0;

		if (hr_start)
		  h_act	  <=	1'b1;
		else if (hr_end)
		  h_act	  <=	1'b0;
	end

always@(posedge iCLK or negedge iRSTN)
	if(!iRSTN)
	begin
		v_count		<=	10'b0;
		oVGA_VS		<=	1'b1;
		v_act	    <=	1'b0;
	end
	else 
	begin		
		if (h_max)
		begin
		  if (v_max)
		    v_count	<=	10'b0;
		  else
		    v_count	<=	v_count + 10'b1;

		  if (vs_end && !v_max)
		    oVGA_VS	<=	1'b1;
		  else
		    oVGA_VS	<=	1'b0;

  		if (vr_start)
	  	  v_act <=	1'b1;
		  else if (vr_end)
		    v_act <=	1'b0;
		end
	end

endmodule