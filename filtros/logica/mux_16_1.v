


module mux_16_1(
	entrada_1,
	entrada_2,
	entrada_3,
	entrada_4,
	entrada_5,
	entrada_6,
	entrada_7,
	entrada_8,
	entrada_9,
	entrada_10,
	entrada_11,
	entrada_12,
	entrada_13,
	entrada_14,
	entrada_15,
	entrada_16,
	seleccion,
	//
	salida
);

//=========================================================================

	parameter BITS_DATOS = 8;

//=========================================================================
	
	input [BITS_DATOS-1:0] entrada_1;
	input [BITS_DATOS-1:0] entrada_2;
	input [BITS_DATOS-1:0] entrada_3;
	input [BITS_DATOS-1:0] entrada_4;
	input [BITS_DATOS-1:0] entrada_5;
	input [BITS_DATOS-1:0] entrada_6;
	input [BITS_DATOS-1:0] entrada_7;
	input [BITS_DATOS-1:0] entrada_8;
	input [BITS_DATOS-1:0] entrada_9;
	input [BITS_DATOS-1:0] entrada_10;
	input [BITS_DATOS-1:0] entrada_11;
	input [BITS_DATOS-1:0] entrada_12;
	input [BITS_DATOS-1:0] entrada_13;
	input [BITS_DATOS-1:0] entrada_14;
	input [BITS_DATOS-1:0] entrada_15;
	input [BITS_DATOS-1:0] entrada_16;
	input [3:0] seleccion;
	//
	output reg [BITS_DATOS-1:0] salida;
	
//=========================================================================	

	always @(*) begin
		case(seleccion)
			0:
				salida = entrada_1;
			1:
				salida = entrada_2;
			2:
				salida = entrada_3;
			3:
				salida = entrada_4;
			4:
				salida = entrada_5;
			5:
				salida = entrada_6;
			6:
				salida = entrada_7;
			7:
				salida = entrada_8;
			8:
				salida = entrada_9;
			9:
				salida = entrada_10;
			10:
				salida = entrada_11;
			11:
				salida = entrada_12;
			12:
				salida = entrada_13;
			13:
				salida = entrada_14;
			14:
				salida = entrada_15;
			15:
				salida = entrada_16;
			default:
				salida = entrada_1;
		endcase
	end
	
	
	
	
endmodule





