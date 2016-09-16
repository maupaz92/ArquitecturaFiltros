`timescale 1ns / 1ps


module sumador_3_lanes_TEST;

	reg clk;
	// Inputs
	reg signed [10:0] data_a;
	reg signed [10:0] data_b;

	//outputs
	wire [10:0] suma;
	

	
	sumador_3_lanes sumador(
		.dataa(data_a),
		.datab(data_b),
		.result(suma)
	);

	
	localparam T = 20;
	
	always begin
		clk = 0;
		#(T/2);
		clk = 1;
		#(T/2);
	end


	initial begin
	
		data_a = 5;
		data_b = 5;
		
		repeat(2) @(posedge clk);
		data_a = 2;
		data_b = -1;
	
		//
		repeat(2) @(posedge clk);
		data_a = 4;
		data_b = -10;
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
		
		
		//
		repeat(2) @(posedge clk);
		
		@(posedge clk);
		
		//
		repeat(2) @(posedge clk);
		
		@(posedge clk);

		
	end
      
endmodule

