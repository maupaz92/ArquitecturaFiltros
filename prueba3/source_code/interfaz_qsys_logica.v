

/*

onchip port 1 = instrucciones

onchip port 2 = datos mascara

offchip port 1 = pixeles imagen


*/

module interfaz_qsys_logica #(
	parameter BITS_MEMORY_DATA = 32,
	parameter BITS_ADDR_MEM_ONCHIP = 14,
	parameter BITS_ADDR_MEM_OFFCHIP = 14,
	parameter BITS_BUS_DIRECCION_INSTR = 8,
	parameter BITS_BUS_DATOS_INSTR = 24
)
(
	input clk,
	input reset,
	
	input op_complete_mem_onchip_port_1,
	input op_complete_mem_onchip_port_2,
	input op_complete_mem_offchip_port_1,
	
	input [BITS_MEMORY_DATA-1:0] data_mem_onchip_port_1,
	input [BITS_MEMORY_DATA-1:0] data_mem_onchip_port_2,
	input [BITS_MEMORY_DATA-1:0] data_mem_offchip_port_1,
	
	input iniciar_lectura_instrucciones,
	
	// 
	
	output read_mem_onchip_port_1,
	output read_mem_onchip_port_2,
	output read_mem_offchip_port_1,
	
	output write_mem_onchip_port_1,
	output write_mem_onchip_port_2,
	output write_mem_offchip_port_1,
	
	output [BITS_MEMORY_DATA-1:0] write_data_mem_onchip_port_1,
	output [BITS_MEMORY_DATA-1:0] write_data_mem_onchip_port_2,
	output [BITS_MEMORY_DATA-1:0] write_data_mem_offchip_port_1,
	
	output [BITS_ADDR_MEM_ONCHIP-1:0] address_mem_onchip_port_1,
	output [BITS_ADDR_MEM_ONCHIP-1:0] address_mem_onchip_port_2,
	output [BITS_ADDR_MEM_OFFCHIP-1:0] address_mem_offchip_port_1
	
);

	reg habilitar_registros_mascara;
	reg habilitar_registros_ventana;
	
	wire [BITS_ADDR_MEM_ONCHIP-1:0] direcc_mem_inicio_mascara;
	wire [BITS_ADDR_MEM_OFFCHIP-1:0] direcc_mem_inicio_imagen;
	wire [2:0] tamano_mascara;
	wire [2:0] cantidad_buffers_internos;
	wire [BITS_BUS_DATOS_INSTR-1:0] cantidad_lecturas_mem;

	/*
	 *
	==========================================================================
	CONTEXTO: 
	*
	*/
	program_counter program_counter_inst(
		.clk(clk),
		.reset(reset),
		.iniciar(iniciar_lectura_instrucciones),
		.reiniciar(),
		.lectura_completada(op_complete_mem_onchip_port_1),
		.instruccion_actual(data_mem_onchip_port_1),
		//
		.leer_siguiente_inst(read_mem_onchip_port_1),
		.direccion_siguiente_inst(address_mem_onchip_port_1)
	);

	defparam program_counter_inst.BITS_DIRECCION_MEMORIA = BITS_ADDR_MEM_ONCHIP;


	/*
	 *
	==========================================================================
	CONTEXTO: 
	*
	*/
	always@(*) begin
		case({op_complete_mem_onchip_port_1, data_mem_onchip_port_1[BITS_MEMORY_DATA-1:BITS_MEMORY_DATA-2]})
			'b101:
				habilitar_registros_mascara = 1;
			'b110:
				habilitar_registros_ventana = 1;
			default: begin
				habilitar_registros_mascara = 0;
				habilitar_registros_ventana = 0;
			end
		endcase
	end
	
	

	/*
	 *
	==========================================================================
	CONTEXTO: 
	*
	*/
	control_mascara control_mascara_inst
	(
		.clk(clk),
		.reset(reset),
		//31-24
		.direccion_registros(data_mem_onchip_port_1[BITS_MEMORY_DATA-1:BITS_BUS_DATOS_INSTR]),
		//23-0
		.datos_registros(data_mem_onchip_port_1[BITS_BUS_DATOS_INSTR-1:0]),
		.habilitacion_registros(habilitar_registros_mascara),
		//
		.direccion_mem_inicio_mascara(direcc_mem_inicio_mascara),
		.tamano_mascara(tamano_mascara)
	);
	
	// este valor no se sabe especificamente, depende el tamano de la mem en qsys
	defparam control_mascara_inst.BITS_DIRECCION_MEM = BITS_ADDR_MEM_ONCHIP;
	
	
	
	/*
	 *
	==========================================================================
	CONTEXTO: 
	*
	*/
	control_ventana control_ventana_inst
	(
		.clk(clk),
		.reset(reset),
		.direccion_registros(data_mem_onchip_port_1[BITS_MEMORY_DATA-1:BITS_BUS_DATOS_INSTR]),
		.datos_registros(data_mem_onchip_port_1[BITS_BUS_DATOS_INSTR-1:0]),
		.habilitacion_registros(habilitar_registros_ventana),
		//
		.direccion_mem_inicio_imagen(direcc_mem_inicio_imagen),
		.cantidad_lecturas_mem(cantidad_lecturas_mem),
		.cantidad_buffers_internos(cantidad_buffers_internos)
	);
	
	// este valor no se sabe especificamente, depende el tamano de la mem en qsys
	defparam control_ventana_inst.BITS_DIRECCION_MEM = BITS_ADDR_MEM_OFFCHIP;



endmodule










