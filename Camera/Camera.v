// --------------------------------------------------------------------
// Copyright (c) 2011 by Terasic Technologies Inc. 
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
// Major Functions:	CAMERA
//
// --------------------------------------------------------------------
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| Vic Chang         :| 08/08/11  :| Initial Revision
// --------------------------------------------------------------------

module Camera(

	//////// CLOCK //////////
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,

	//////// Sma //////////
	SMA_CLKIN,
	SMA_CLKOUT,

	//////// LED //////////
	LEDG,
	LEDR,

	//////// KEY //////////
	KEY,

	//////// EJTAG //////////
	EX_IO,

	//////// SW //////////
	SW,

	//////// SEG7 //////////
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7,

	//////// LCD //////////
	LCD_BLON,
	LCD_DATA,
	LCD_EN,
	LCD_ON,
	LCD_RS,
	LCD_RW,

	//////// RS232 //////////
	UART_CTS,
	UART_RTS,
	UART_RXD,
	UART_TXD,

	//////// PS2 for Keyboard and Mouse //////////
	PS2_CLK,
	PS2_CLK2,
	PS2_DAT,
	PS2_DAT2,

	//////// SDCARD //////////
	SD_CLK,
	SD_CMD,
	SD_DAT,
	SD_WP_N,

	//////// VGA //////////
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,

	//////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	//////// I2C for EEPROM //////////
	EEP_I2C_SCLK,
	EEP_I2C_SDAT,

	//////// I2C for Audio Tv-Decoder HSMC  //////////
	I2C_SCLK,
	I2C_SDAT,

	//////// Ethernet 0 //////////
	ENET0_GTX_CLK,
	ENET0_INT_N,
	ENET0_LINK100,
	ENET0_MDC,
	ENET0_MDIO,
	ENET0_RST_N,
	ENET0_RX_CLK,
	ENET0_RX_COL,
	ENET0_RX_CRS,
	ENET0_RX_DATA,
	ENET0_RX_DV,
	ENET0_RX_ER,
	ENET0_TX_CLK,
	ENET0_TX_DATA,
	ENET0_TX_EN,
	ENET0_TX_ER,
	ENETCLK_25,

	//////// Ethernet 1 //////////
	ENET1_GTX_CLK,
	ENET1_INT_N,
	ENET1_LINK100,
	ENET1_MDC,
	ENET1_MDIO,
	ENET1_RST_N,
	ENET1_RX_CLK,
	ENET1_RX_COL,
	ENET1_RX_CRS,
	ENET1_RX_DATA,
	ENET1_RX_DV,
	ENET1_RX_ER,
	ENET1_TX_CLK,
	ENET1_TX_DATA,
	ENET1_TX_EN,
	ENET1_TX_ER,

	//////// TV Decoder //////////
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET_N,
	TD_VS,

	//////// USB 2.0 OTG //////////
	OTG_ADDR,
	OTG_CS_N,
	OTG_DACK_N,
	OTG_DATA,
	OTG_DREQ,
	OTG_FSPEED,
	OTG_INT,
	OTG_LSPEED,
	OTG_RD_N,
	OTG_RST_N,
	OTG_WE_N,

	//////// IR Receiver //////////
	IRDA_RXD,

	//////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N,

	//////// SRAM //////////
	SRAM_ADDR,
	SRAM_CE_N,
	SRAM_DQ,
	SRAM_LB_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_WE_N,

	//////// Flash //////////
	FL_ADDR,
	FL_CE_N,
	FL_DQ,
	FL_OE_N,
	FL_RST_N,
	FL_RY,
	FL_WE_N,
	FL_WP_N,

	//HMSC, HSMC connect to MTLC
	//MTL
	LCD_B,
	LCD_DCLK,
	LCD_G,
	LCD_HSD,
	TOUCH_I2C_SCL,
	TOUCH_I2C_SDA,
	TOUCH_INT_n,
	LCD_R,
	LCD_VSD,
	
	LCD_DITH,
	LCD_MODE,
	LCD_POWER_CTL,
	LCD_UPDN,
	LCD_RSTB,
	LCD_DE,
	LCD_SHLR,
	LCD_DIM,
	
	//D5M
	CAMERA_LVAL,
	CAMERA_PIXCLK,
	CAMERA_RESET_n,
	CAMERA_SCLK,
	CAMERA_SDATA,
	CAMERA_STROBE,
	CAMERA_TRIGGER,
	CAMERA_XCLKIN,
	CAMERA_D,
	CAMERA_FVAL,
	//LIGHT SENSOR
	LSENSOR_ADDR_SEL,
	LSENSOR_SCL,
	LSENSOR_SDA,
	LSENSOR_INT,
	//G_Sensor
	GSENSOR_CS_n,
	GSENSOR_INT1,
	GSENSOR_INT2,
	GSENSOR_ALT_ADDR,
	GSENSOR_SDA_SDI_SDIO,
	GSENSOR_SCL_SCLK
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input		          		CLOCK_50;
input		          		CLOCK2_50;
input		          		CLOCK3_50;

//////////// Sma //////////
input		          		SMA_CLKIN;
output		          	SMA_CLKOUT;

//////////// LED //////////
output		   [8:0]		LEDG;
output		  [17:0]		LEDR;

//////////// KEY //////////
input		      [3:0]		KEY;

//////////// EJTAG //////////
inout		      [6:0]		EX_IO;

//////////// SW //////////
input		     [17:0]		SW;

//////////// SEG7 //////////
output		   [6:0]		HEX0;
output		   [6:0]		HEX1;
output		   [6:0]		HEX2;
output		   [6:0]		HEX3;
output		   [6:0]		HEX4;
output		   [6:0]		HEX5;
output		   [6:0]		HEX6;
output		   [6:0]		HEX7;

//////////// LCD //////////
output		        		LCD_BLON;
inout		      [7:0]		LCD_DATA;
output		          	LCD_EN;
output		          	LCD_ON;
output		          	LCD_RS;
output		          	LCD_RW;

//////////// RS232 //////////
output		          	UART_CTS;
input		          		UART_RTS;
input		          		UART_RXD;
output		          	UART_TXD;

//////////// PS2 for Keyboard and Mouse //////////
inout		          		PS2_CLK;
inout		          		PS2_CLK2;
inout		          		PS2_DAT;
inout		          		PS2_DAT2;

//////////// SDCARD //////////
output		          	SD_CLK;
inout		          		SD_CMD;
inout		     [3:0]		SD_DAT;
input		          		SD_WP_N;

//////////// VGA //////////
output		   [7:0]		VGA_B;
output		        		VGA_BLANK_N;
output		        		VGA_CLK;
output		   [7:0]		VGA_G;
output		        		VGA_HS;
output		   [7:0]		VGA_R;
output		        		VGA_SYNC_N;
output		        		VGA_VS;

//////////// Audio //////////
input		          		AUD_ADCDAT;
inout		          		AUD_ADCLRCK;
inout		          		AUD_BCLK;
output		          	AUD_DACDAT;
inout		          		AUD_DACLRCK;
output		        		AUD_XCK;

//////////// I2C for EEPROM //////////
output		          	EEP_I2C_SCLK;
inout		          		EEP_I2C_SDAT;

//////////// I2C for Audio Tv-Decoder HSMC  //////////
output		        		I2C_SCLK;
inout		          		I2C_SDAT;

//////////// Ethernet 0 //////////
output		          	ENET0_GTX_CLK;
input		          		ENET0_INT_N;
input		          		ENET0_LINK100;
output		          	ENET0_MDC;
inout		          		ENET0_MDIO;
output		          	ENET0_RST_N;
input		          		ENET0_RX_CLK;
input		          		ENET0_RX_COL;
input		          		ENET0_RX_CRS;
input		     [3:0]		ENET0_RX_DATA;
input		          		ENET0_RX_DV;
input		          		ENET0_RX_ER;
input		          		ENET0_TX_CLK;
output		  [3:0]	   ENET0_TX_DATA;
output		         	ENET0_TX_EN;
output		        		ENET0_TX_ER;
input		          		ENETCLK_25;

//////////// Ethernet 1 //////////
output		          	ENET1_GTX_CLK;
input		          		ENET1_INT_N;
input		          		ENET1_LINK100;
output		          	ENET1_MDC;
inout		          		ENET1_MDIO;
output		          	ENET1_RST_N;
input		          		ENET1_RX_CLK;
input		          		ENET1_RX_COL;
input		          		ENET1_RX_CRS;
input		     [3:0]		ENET1_RX_DATA;
input		          		ENET1_RX_DV;
input		          		ENET1_RX_ER;
input		          		ENET1_TX_CLK;
output		  [3:0]		ENET1_TX_DATA;
output		        		ENET1_TX_EN;
output		        		ENET1_TX_ER;

//////////// TV Decoder //////////
input		          		TD_CLK27;
input		     [7:0]		TD_DATA;
input		          		TD_HS;
output		          	TD_RESET_N;
input		          		TD_VS;

//////////// USB 2.0 OTG //////////
output	    [1:0]		OTG_ADDR;
output		        		OTG_CS_N;
output	    [1:0]		OTG_DACK_N;
inout		   [15:0]		OTG_DATA;
input		    [1:0]		OTG_DREQ;
inout		          		OTG_FSPEED;
input		    [1:0]		OTG_INT;
inout		          		OTG_LSPEED;
output		        		OTG_RD_N;
output		        		OTG_RST_N;
output		        		OTG_WE_N;

//////////// IR Receiver //////////
input		          		IRDA_RXD;

//////////// SDRAM //////////
output		 [12:0]		DRAM_ADDR;
output		  [1:0]		DRAM_BA;
output		        		DRAM_CAS_N;
output		        		DRAM_CKE;
output		        		DRAM_CLK;
output		        		DRAM_CS_N;
inout		   [31:0]		DRAM_DQ;
output		 [3:0]		DRAM_DQM;
output		          	DRAM_RAS_N;
output		        		DRAM_WE_N;

//////////// SRAM //////////
output		 [19:0]		SRAM_ADDR;
output		        		SRAM_CE_N;
inout		    [15:0]		SRAM_DQ;
output		        		SRAM_LB_N;
output		        		SRAM_OE_N;
output		        		SRAM_UB_N;
output		        		SRAM_WE_N;

//////////// Flash //////////
output		  [22:0]		FL_ADDR;
output		        		FL_CE_N;
inout		     [7:0]		FL_DQ;
output		        		FL_OE_N;
output		        		FL_RST_N;
input		          		FL_RY;
output		        		FL_WE_N;
output		        		FL_WP_N;

//////////// HSMC, HSMC connect to MTLC //////////
//MTL
output		     [7:0]		LCD_B;
output		          		LCD_DCLK;
output		     [7:0]		LCD_G;
output		          		LCD_HSD;
output		          		TOUCH_I2C_SCL;
inout 		          		TOUCH_I2C_SDA;
input 		          		TOUCH_INT_n;
output		     [7:0]		LCD_R;
output		          		LCD_VSD;

output                     LCD_DITH;
output                     LCD_MODE;
output                     LCD_POWER_CTL;
output                     LCD_UPDN;
output                     LCD_RSTB;
output                     LCD_DE;
output                     LCD_SHLR;
output                     LCD_DIM;

//D5M
input		          		   CAMERA_LVAL;
input		          			CAMERA_PIXCLK;
output		          		CAMERA_RESET_n;
output		          		CAMERA_SCLK;
inout		          			CAMERA_SDATA;
input		          			CAMERA_STROBE;
output		        			CAMERA_TRIGGER;
output		        			CAMERA_XCLKIN;
input		    		[11:0]	CAMERA_D;
input		          			CAMERA_FVAL;
//LIGHT SENSOR
output                     LSENSOR_ADDR_SEL;
output                     LSENSOR_SCL;
inout                      LSENSOR_SDA;
input                      LSENSOR_INT;
//G_Sensor
output                     GSENSOR_CS_n;
input                      GSENSOR_INT1;
input                      GSENSOR_INT2;
output                     GSENSOR_ALT_ADDR;
inout                      GSENSOR_SDA_SDI_SDIO;
output                     GSENSOR_SCL_SCLK;




//=======================================================
//  REG/WIRE declarations
//=======================================================
wire	[15:0]	Read_DATA1;
wire	[15:0]	Read_DATA2;

wire	[11:0]	mCCD_DATA;
wire			   mCCD_DVAL;
wire			   mCCD_DVAL_d;
wire	[15:0]	X_Cont;
wire	[15:0]	Y_Cont;
wire	[9:0]	   X_ADDR;
wire	[31:0]	Frame_Cont;
wire			   DLY_RST_0;
wire			   DLY_RST_1;
wire			   DLY_RST_2;
wire			   DLY_RST_3;
wire			   DLY_RST_4;
wire			   Read;
reg	[11:0]	rCCD_DATA;
reg				rCCD_LVAL;
reg				rCCD_FVAL;
wire	[11:0]	sCCD_R;
wire	[11:0]	sCCD_G;
wire	[11:0]	sCCD_B;
wire			   sCCD_DVAL;
wire			   sdram_ctrl_clk;

//ltp
wire           LTP_CTRL_CLK;
wire	[7:0]	   lcd_r;		//	LTM Red Data 8 Bits
wire	[7:0]	   lcd_g;		//	LTM Green Data 8 Bits
wire	[7:0]	   lcd_b;		//	LTM Blue Data 8 Bits
wire           lcd_hs;
wire           lcd_vs;
wire           lcd_clk;
//power on start
wire             auto_start;
//=======================================================
//  Structural coding
//=======================================================
wire reset_n;

assign LCD_MODE = 1'b0;  //HSD/VSD mode
assign LCD_RSTB = 1'b1; //NO RESET
assign SHLR     = 1'b1; //LEFT-->RIGHT
assign UPDN     = 1'b0; //UP-->DOWN
assign LCD_DIM  = 1'b1;
assign LCD_POWER_CTL = 1'b1;

assign	LTP_CTRL_CLK = lcd_clk;
	
// D5M
assign	CAMERA_TRIGGER	    =	1'b1;  // tRIGGER
assign	CAMERA_RESET_n	    =	DLY_RST_1;

assign	LEDR		    =	SW;
assign	LEDG		    =	Y_Cont;
assign	UART_TXD     = UART_RXD;

// MTL - display
assign {LCD_B,LCD_G,LCD_R} = {lcd_b, lcd_g, lcd_r};
assign LCD_DCLK = lcd_clk;
assign LCD_HSD = lcd_hs;
assign LCD_VSD = lcd_vs;
//auto start when power on
assign auto_start = ((KEY[0])&&(DLY_RST_3)&&(!DLY_RST_4))? 1'b1:1'b0;

always@(posedge CAMERA_PIXCLK)
begin
	rCCD_DATA	<=	CAMERA_D;
	rCCD_LVAL	<=	CAMERA_LVAL;
	rCCD_FVAL	<=	CAMERA_FVAL;
end
//reset signals 
Reset_Delay			u2	(	.iCLK(CLOCK2_50),
							.iRST(KEY[0]),
							.oRST_0(DLY_RST_0),
							.oRST_1(DLY_RST_1),
							.oRST_2(DLY_RST_2),
							.oRST_3(DLY_RST_3), //auto-start start point
							.oRST_4(DLY_RST_4)  //auto-start end point
						);
//cmos sensor capture
CCD_Capture			u3	(	.oDATA(mCCD_DATA),
							.oDVAL(mCCD_DVAL),
							.oX_Cont(X_Cont),
							.oY_Cont(Y_Cont),
							.oFrame_Cont(Frame_Cont),
							.iDATA(rCCD_DATA),
							.iFVAL(rCCD_FVAL),
							.iLVAL(rCCD_LVAL),
							.iSTART((!KEY[3])| auto_start),
							.iEND(!KEY[2]),
							.iCLK(~CAMERA_PIXCLK),
							.iRST(DLY_RST_2)
						);
//raw data to RGB conversion
RAW2RGB				u4	(	.iCLK(CAMERA_PIXCLK),
							.iRST_n(DLY_RST_1),
							.iData(mCCD_DATA),
							.iDval(mCCD_DVAL),
							.oRed(sCCD_R),
							.oGreen(sCCD_G),
							.oBlue(sCCD_B),
							.oDval(sCCD_DVAL),
							.iMIRROR(SW[17]),
							.iX_Cont(X_Cont),
							.iY_Cont(Y_Cont)
						);
//frame number display
SEG7_LUT_8 			u5	(	.oSEG0(HEX0),.oSEG1(HEX1),
							.oSEG2(HEX2),.oSEG3(HEX3),
							.oSEG4(HEX4),.oSEG5(HEX5),
							.oSEG6(HEX6),.oSEG7(HEX7),
							.iDIG(Frame_Cont[31:0])
						);
//pll
sdram_pll 			u6	(
							.inclk0(CLOCK2_50),
							.c0(sdram_ctrl_clk),
							.c1(DRAM_CLK),
							.c2(CAMERA_XCLKIN), // cmos sensor main clock input,25M
							.c3(lcd_clk) // cmos sensor lcd pix clock,33M
						);
//frame buffer
Sdram_Control	u7	(	//	HOST Side						
						    .RESET_N(KEY[0]),
							.CLK(sdram_ctrl_clk),

							//	FIFO Write Side 1
							.WR1_DATA({1'b0,sCCD_G[11:7],sCCD_B[11:2]}),
							.WR1(sCCD_DVAL),
							.WR1_ADDR(0),
							.WR1_MAX_ADDR(800*480/2),
							.WR1_LENGTH(8'h80),
							.WR1_LOAD(!DLY_RST_0),
							.WR1_CLK(CAMERA_PIXCLK),

							//	FIFO Write Side 2
							.WR2_DATA(	{1'b0,sCCD_G[6:2],sCCD_R[11:2]}),
							//.WR2_DATA(	{6'b000000,10'b1111111111}),
							.WR2(sCCD_DVAL),
							.WR2_ADDR(23'h100000),
							.WR2_MAX_ADDR(23'h100000+800*480/2),
							.WR2_LENGTH(8'h80),
							.WR2_LOAD(!DLY_RST_0),
							.WR2_CLK(CAMERA_PIXCLK),


							//	FIFO Read Side 1
						    .RD1_DATA(Read_DATA1),
				        	.RD1(Read),
				        	.RD1_ADDR(0),
							.RD1_MAX_ADDR(800*480/2),
							.RD1_LENGTH(8'h80),
							.RD1_LOAD(!DLY_RST_0),
							.RD1_CLK(~LTP_CTRL_CLK),
							
							//	FIFO Read Side 2
						    .RD2_DATA(Read_DATA2),
							.RD2(Read),
							.RD2_ADDR(23'h100000),
							.RD2_MAX_ADDR(23'h100000+800*480/2),
							.RD2_LENGTH(8'h80),
				        	.RD2_LOAD(!DLY_RST_0),
							.RD2_CLK(~LTP_CTRL_CLK),
							
							//	SDRAM Side
						   .SA(DRAM_ADDR),
							.BA(DRAM_BA),
							.CS_N(DRAM_CS_N),
							.CKE(DRAM_CKE),
							.RAS_N(DRAM_RAS_N),
							.CAS_N(DRAM_CAS_N),
							.WE_N(DRAM_WE_N),
							.DQ(DRAM_DQ),
							.DQM(DRAM_DQM)
						);
//cmos sensor configuration
I2C_CCD_Config 		u8	(	//	Host Side
							.iCLK(CLOCK2_50),
							.iRST_N(DLY_RST_2),
							.iEXPOSURE_ADJ(KEY[1]),
							.iEXPOSURE_DEC_p(SW[0]),
							.iMIRROR_SW(SW[17]),
							//	I2C Side
							.I2C_SCLK(CAMERA_SCLK),
							.I2C_SDAT(CAMERA_SDATA)
						);
//ltp controller
ltp_controller		u1	( 	.iCLK(LTP_CTRL_CLK),
							.iRST_n(DLY_RST_2),
							// sdram side
							.iREAD_DATA1(Read_DATA1),
							.iREAD_DATA2(Read_DATA2),
							.oREAD_SDRAM_EN(Read),
							// lcd side
							.oLCD_R(lcd_r),
							.oLCD_G(lcd_g),
							.oLCD_B(lcd_b),
							.oHD(lcd_hs),
							.oVD(lcd_vs),
							.oDEN()
							);

endmodule
