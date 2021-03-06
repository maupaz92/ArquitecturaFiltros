// megafunction wizard: %ALTGX_RECONFIG%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: alt_c3gxb_reconfig 

// ============================================================
// File Name: altgxb_reconfig.v
// Megafunction Name(s):
// 			alt_c3gxb_reconfig
//
// Simulation Library Files(s):
// 			
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 15.1.0 Build 185 10/21/2015 SJ Lite Edition
// ************************************************************

//Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, the Altera Quartus Prime License Agreement,
//the Altera MegaCore Function License Agreement, or other 
//applicable license agreement, including, without limitation, 
//that your use is for the sole purpose of programming logic 
//devices manufactured by Altera and sold by Altera or its 
//authorized distributors.  Please refer to the applicable 
//agreement for further details.

module altgxb_reconfig (
	offset_cancellation_reset,
	reconfig_clk,
	reconfig_data,
	reconfig_fromgxb,
	reconfig_reset,
	write_all,
	busy,
	channel_reconfig_done,
	reconfig_address_out,
	reconfig_togxb)/* synthesis synthesis_clearbox = 1 */;

	input	  offset_cancellation_reset;
	input	  reconfig_clk;
	input	[15:0]  reconfig_data;
	input	[4:0]  reconfig_fromgxb;
	input	  reconfig_reset;
	input	  write_all;
	output	  busy;
	output	  channel_reconfig_done;
	output	[5:0]  reconfig_address_out;
	output	[3:0]  reconfig_togxb;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  offset_cancellation_reset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ADCE NUMERIC "0"
// Retrieval info: PRIVATE: CMU_PLL NUMERIC "0"
// Retrieval info: PRIVATE: DATA_RATE NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV GX"
// Retrieval info: PRIVATE: PMA NUMERIC "0"
// Retrieval info: PRIVATE: PROTO_SWITCH NUMERIC "1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: CONSTANT: CBX_BLACKBOX_LIST STRING "-lpm_mux"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone IV GX"
// Retrieval info: CONSTANT: MIF_ADDRESS_WIDTH NUMERIC "6"
// Retrieval info: CONSTANT: NUMBER_OF_CHANNELS NUMERIC "1"
// Retrieval info: CONSTANT: NUMBER_OF_RECONFIG_PORTS NUMERIC "1"
// Retrieval info: CONSTANT: enable_buf_cal STRING "true"
// Retrieval info: CONSTANT: reconfig_fromgxb_width NUMERIC "5"
// Retrieval info: CONSTANT: reconfig_togxb_width NUMERIC "4"
// Retrieval info: USED_PORT: busy 0 0 0 0 OUTPUT NODEFVAL "busy"
// Retrieval info: USED_PORT: channel_reconfig_done 0 0 0 0 OUTPUT NODEFVAL "channel_reconfig_done"
// Retrieval info: USED_PORT: reconfig_address_out 0 0 6 0 OUTPUT NODEFVAL "reconfig_address_out[5..0]"
// Retrieval info: USED_PORT: reconfig_clk 0 0 0 0 INPUT NODEFVAL "reconfig_clk"
// Retrieval info: USED_PORT: reconfig_data 0 0 16 0 INPUT NODEFVAL "reconfig_data[15..0]"
// Retrieval info: USED_PORT: reconfig_fromgxb 0 0 5 0 INPUT NODEFVAL "reconfig_fromgxb[4..0]"
// Retrieval info: USED_PORT: reconfig_reset 0 0 0 0 INPUT NODEFVAL "reconfig_reset"
// Retrieval info: USED_PORT: reconfig_togxb 0 0 4 0 OUTPUT NODEFVAL "reconfig_togxb[3..0]"
// Retrieval info: USED_PORT: write_all 0 0 0 0 INPUT NODEFVAL "write_all"
// Retrieval info: CONNECT: @reconfig_clk 0 0 0 0 reconfig_clk 0 0 0 0
// Retrieval info: CONNECT: @reconfig_data 0 0 16 0 reconfig_data 0 0 16 0
// Retrieval info: CONNECT: @reconfig_fromgxb 0 0 5 0 reconfig_fromgxb 0 0 5 0
// Retrieval info: CONNECT: @reconfig_mode_sel 0 0 1 1 GND 0 0 1 1
// Retrieval info: CONNECT: @reconfig_mode_sel 0 0 1 2 GND 0 0 1 2
// Retrieval info: CONNECT: @reconfig_mode_sel 0 0 1 0 VCC 0 0 1 0
// Retrieval info: CONNECT: @reconfig_reset 0 0 0 0 reconfig_reset 0 0 0 0
// Retrieval info: CONNECT: @write_all 0 0 0 0 write_all 0 0 0 0
// Retrieval info: CONNECT: busy 0 0 0 0 @busy 0 0 0 0
// Retrieval info: CONNECT: channel_reconfig_done 0 0 0 0 @channel_reconfig_done 0 0 0 0
// Retrieval info: CONNECT: reconfig_address_out 0 0 6 0 @reconfig_address_out 0 0 6 0
// Retrieval info: CONNECT: reconfig_togxb 0 0 4 0 @reconfig_togxb 0 0 4 0
// Retrieval info: GEN_FILE: TYPE_NORMAL altgxb_reconfig.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL altgxb_reconfig.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altgxb_reconfig.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altgxb_reconfig.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL altgxb_reconfig_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL altgxb_reconfig_bb.v TRUE
