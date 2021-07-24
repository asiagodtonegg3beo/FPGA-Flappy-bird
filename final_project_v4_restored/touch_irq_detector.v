// --------------------------------------------------------------------
// Copyright (c) 2005 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            		:| Mod. Date :| Changes Made:
//   V1.0 :| Johnny Fan				:| 07/06/30  :| Initial Revision
// --------------------------------------------------------------------
module touch_irq_detector	(
					iCLK,
					iRST_n,
					iTOUCH_IRQ,
					iREG_GESTURE,
					iX_COORD,
					iY_COORD,
					iNEW_COORD,
					iReady,
					oDISPLAY_MODE,
					oButton_state
					);
					
//============================================================================
// PARAMETER declarations
//============================================================================					
parameter	TOUCH_CNT_CLEAR = 24'hffffff;  // total photo numbers 
                    
//===========================================================================
// PORT declarations
//===========================================================================                      
input			iCLK;				// system clock 50Mhz
input			iRST_n;				// system reset
input			iTOUCH_IRQ;		
input [7:0] iREG_GESTURE;
input	[9:0]	iX_COORD;			// X coordinate form touch panel
input	[8:0]	iY_COORD;			// Y coordinate form touch panel
input			iNEW_COORD;			// new coordinates indicate
input iReady;
output	[2:0]	oDISPLAY_MODE;		// displaed photo number
output [3:0] oButton_state; 
//=============================================================================
// REG/WIRE declarations
//=============================================================================
reg				touch_en;
reg				touch_en_clr;
reg 	[24:0] 	touch_delay_cnt;
reg 	[1:0] 	oDISPLAY_MODE;
//reg [3:0] oButton_state; 

reg [9:0] 	X_COORD;
reg [8:0]	Y_COORD;
//=============================================================================
// Structural coding
//=============================================================================
assign right_btn = (iX_COORD>10'd700&&iX_COORD<10'd800&&iReady)?1'b1:1'b0;
assign left_btn = (iX_COORD>10'd600&&iX_COORD<10'd700&&iReady)?1'b1:1'b0;
assign up_btn = (iX_COORD >10'd0&&iX_COORD<10'd100&&iReady)?1'b1:1'b0;
assign oButton_state = {1'b0,up_btn,left_btn,right_btn};


always @(posedge iCLK or negedge iRST_n)
begin	
		if (!iRST_n)
			begin
					X_COORD <= 0;
					Y_COORD <= 0;
			end		
		else  
			begin
				X_COORD <= iX_COORD;
				Y_COORD <= iY_COORD;
			end	
		 	
end	

always@(posedge iCLK or negedge iRST_n)
	begin
		if (!iRST_n)
			touch_en <= 0;
		else if (touch_en_clr)
			touch_en <= 0;	
		else if (iTOUCH_IRQ)
		    touch_en <= 1;
	end
	
	
always@(posedge iCLK or negedge iRST_n)
	begin	
		if (!iRST_n)
			begin
				touch_delay_cnt <= 0;
				touch_en_clr <= 0;
			end		
		else if (touch_delay_cnt == TOUCH_CNT_CLEAR)
			begin
				touch_delay_cnt <= 0;
				touch_en_clr <= 1;
			end	
		else if (touch_en)
			touch_delay_cnt <= touch_delay_cnt + 1;
		else
			begin
				touch_delay_cnt <= 0;
				touch_en_clr <= 0;
			end	
	end					
wire			leftpic_en;
wire rightpic_en;
wire one_touch_en;
assign	leftpic_en = ((X_COORD < 10'h0A0) && (X_COORD > 10'h000) &&     //left_
					  (Y_COORD > 9'h150) && (Y_COORD <  9'h1ff))
					  ?1:0;

assign	rightpic_en = ((X_COORD < 10'h31E) && (X_COORD > 10'h29f)  &&  //right
					 (Y_COORD > 9'h150) && (Y_COORD <  9'h1ff))
					  ?1:0;
assign one_touch_en	 = (iREG_GESTURE==8'h20 || iREG_GESTURE==8'h22) ? 1 :0;			  
  					  
/*
always@(posedge iCLK or negedge iRST_n)
	begin	
		if (!iRST_n)
			oDISPLAY_MODE <= 0;
		else if (iTOUCH_IRQ && !touch_en  && nextpic_en ) //left_down x= 300-fff y=300-fff
		begin
		 		     
			oDISPLAY_MODE <= 2'b01; //down
				end
			else if (iTOUCH_IRQ && !touch_en  && otherpic_en ) //left_up x= 300-fff y=0-300
		begin
		      
			oDISPLAY_MODE <= 2'b10;//up
			
				end
				
	end		
*/
/*
always@(posedge iCLK or negedge iRST_n)
	begin	
		if (!iRST_n)
			oDISPLAY_MODE <= 0;
		else if (  nextpic_en ) //left_down x= 300-fff y=300-fff
		begin
		 		     
			oDISPLAY_MODE <= 2'b01; //down
				end
		else if (  otherpic_en ) //left_up x= 300-fff y=0-300
		begin
		      
			oDISPLAY_MODE <= 2'b10;//up
			
				end
			
	end		
*/
always@(posedge iCLK or negedge iRST_n)
	begin	
		if (!iRST_n)
			oDISPLAY_MODE <= 0;
		else if (  leftpic_en  ) //left_down x= 0-10'h0A0 y=9'h150-9'h1ff
		  
			oDISPLAY_MODE <= 2'b01; //up
	 
		else if (  rightpic_en  ) //right x= 300-fff y=0-300
		 
		      
			oDISPLAY_MODE <= 2'b10;//down
			
		 
		
	end

endmodule




								