


`timescale 1ns / 1ps


module multiplicador_sumador_3_lanes_TEST;

	// Inputs
	reg clk;
	reg enable_lanes;
	
	reg [7:0]  dataa_0;
	reg [7:0]  dataa_1;
	reg [7:0]  dataa_2;
	reg signed [9:0]  datab_0;
	reg signed [9:0]  datab_1;
	reg signed [9:0]  datab_2;
	
	
	//outputs
	wire [10:0] resultado;
	

	
	multiplicador_sumador_3_lanes multiplicador_sumador (
		.clock0(clk),
		.dataa_0(dataa_0),
		.dataa_1(dataa_1),
		.dataa_2(dataa_2),
		.datab_0(datab_0),
		.datab_1(datab_1),
		.datab_2(datab_2),
		.ena0(enable_lanes),
		.result(resultado)
	);

	
	localparam T = 20;
	
	always begin
		clk = 0;
		#(T/2);
		clk = 1;
		#(T/2);
	end


	initial begin
	
		dataa_0 = 2;
		dataa_1 = 2;
		dataa_2 = 2;
		
		datab_0 = 2;
		datab_1 = -2;
		datab_2 = 2;

		enable_lanes = 0;
		
		//
		repeat(2) @(posedge clk);
		enable_lanes = 1;
		
		@(posedge clk);
		enable_lanes = 0;

		repeat(3) @(posedge clk);
		//enable_lanes = 0;
		datab_0 = 4;
		datab_1 = 5;
		datab_2 = -2;
		
		@(posedge clk);
		enable_lanes = 1;
		//
		repeat(2) @(posedge clk);
		
		@(posedge clk);
		
		//
		repeat(2) @(posedge clk);
		
		@(posedge clk);
		
		
		//
		repeat(2) @(posedge clk);
		
		@(posedge clk);
		
		//
		repeat(2) @(posedge clk);
		
		@(posedge clk);

		
	end
      
endmodule





