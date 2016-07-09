`timescale 1ns / 1ps




module comparador_bytes_filas(	
	fila_1,
	fila_2,
	fila_3,
	fila_4,
	fila_5,
	seleccion,
	byte_mayor
    );
	 
	 
	input [63:0] fila_1;
	input [63:0] fila_2;
	input [63:0] fila_3;
	input [63:0] fila_4;
	input [63:0] fila_5;
	input [1:0] seleccion;
	output [7:0] byte_mayor;



//==========================================================================

	wire [7:0] f1_b1;
	wire [7:0] f1_b2;
	wire [7:0] f1_b3;
	wire [7:0] f1_b4;
	wire [7:0] f1_b5;
	wire [7:0] mayor_f1;
	

	divisor divisor_1 (
		 .datos(fila_1), 
		 .seleccion(seleccion), 
		 .byte_1(f1_b1), 
		 .byte_2(f1_b2), 
		 .byte_3(f1_b3), 
		 .byte_4(f1_b4), 
		 .byte_5(f1_b5)
		 );


	comparador_mayor_5_bytes comparador_1 (
		 .byte_1(f1_b1), 
		 .byte_2(f1_b2), 
		 .byte_3(f1_b3), 
		 .byte_4(f1_b4), 
		 .byte_5(f1_b5), 
		 .byte_mayor(mayor_f1)
		 );


//==========================================================================

	wire [7:0] f2_b1;
	wire [7:0] f2_b2;
	wire [7:0] f2_b3;
	wire [7:0] f2_b4;
	wire [7:0] f2_b5;
	wire [7:0] mayor_f2;

	divisor divisor_2 (
		 .datos(fila_2), 
		 .seleccion(seleccion), 
		 .byte_1(f2_b1), 
		 .byte_2(f2_b2), 
		 .byte_3(f2_b3), 
		 .byte_4(f2_b4), 
		 .byte_5(f2_b5)
		 );


	comparador_mayor_5_bytes comparador_2 (
		 .byte_1(f2_b1), 
		 .byte_2(f2_b2), 
		 .byte_3(f2_b3), 
		 .byte_4(f2_b4), 
		 .byte_5(f2_b5), 
		 .byte_mayor(mayor_f2)
		 );


//==========================================================================

	wire [7:0] f3_b1;
	wire [7:0] f3_b2;
	wire [7:0] f3_b3;
	wire [7:0] f3_b4;
	wire [7:0] f3_b5;
	wire [7:0] mayor_f3;

	divisor divisor_3 (
		 .datos(fila_3), 
		 .seleccion(seleccion), 
		 .byte_1(f3_b1), 
		 .byte_2(f3_b2), 
		 .byte_3(f3_b3), 
		 .byte_4(f3_b4), 
		 .byte_5(f3_b5)
		 );


	comparador_mayor_5_bytes comparador_3 (
		 .byte_1(f3_b1), 
		 .byte_2(f3_b2), 
		 .byte_3(f3_b3), 
		 .byte_4(f3_b4), 
		 .byte_5(f3_b5), 
		 .byte_mayor(mayor_f3)
		 );

//==========================================================================

	wire [7:0] f4_b1;
	wire [7:0] f4_b2;
	wire [7:0] f4_b3;
	wire [7:0] f4_b4;
	wire [7:0] f4_b5;
	wire [7:0] mayor_f4;

	divisor divisor_4 (
		 .datos(fila_4), 
		 .seleccion(seleccion), 
		 .byte_1(f4_b1), 
		 .byte_2(f4_b2), 
		 .byte_3(f4_b3), 
		 .byte_4(f4_b4), 
		 .byte_5(f4_b5)
		 );


	comparador_mayor_5_bytes comparador_4 (
		 .byte_1(f4_b1), 
		 .byte_2(f4_b2), 
		 .byte_3(f4_b3), 
		 .byte_4(f4_b4), 
		 .byte_5(f4_b5), 
		 .byte_mayor(mayor_f4)
		 );


//==========================================================================

	wire [7:0] f5_b1;
	wire [7:0] f5_b2;
	wire [7:0] f5_b3;
	wire [7:0] f5_b4;
	wire [7:0] f5_b5;
	wire [7:0] mayor_f5;

	divisor divisor_5 (
		 .datos(fila_5), 
		 .seleccion(seleccion), 
		 .byte_1(f5_b1), 
		 .byte_2(f5_b2), 
		 .byte_3(f5_b3), 
		 .byte_4(f5_b4), 
		 .byte_5(f5_b5)
		 );


	comparador_mayor_5_bytes comparador_5 (
		 .byte_1(f5_b1), 
		 .byte_2(f5_b2), 
		 .byte_3(f5_b3), 
		 .byte_4(f5_b4), 
		 .byte_5(f5_b5), 
		 .byte_mayor(mayor_f5)
		 );

/*
CONTEXTO
==========================================================================

*/	

	comparador_mayor_5_bytes comparador_final (
		 .byte_1(mayor_f1), 
		 .byte_2(mayor_f2), 
		 .byte_3(mayor_f3), 
		 .byte_4(mayor_f4), 
		 .byte_5(mayor_f5), 
		 .byte_mayor(byte_mayor)
		 );


endmodule
