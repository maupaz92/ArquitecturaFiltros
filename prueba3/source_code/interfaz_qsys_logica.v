

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
	parameter BITS_BUS_DATOS_INSTR = 24,
	parameter BITS_ELEMENTO_MASCARA = 10
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
	wire [BITS_ADDR_MEM_OFFCHIP-1:0] cantidad_lecturas_mem;
	
	wire space_available_buff_pixels;
	wire data_available_buff_pixeles;
	wire [7:0] pixel_on_buff;
	wire save_mem_data_on_buff;
	wire read_pixel_from_buff;
	wire ventana_pixeles_valida;
	
	
	wire [7:0] pix_1;
	wire [7:0] pix_2;
	wire [7:0] pix_3;
	wire [7:0] pix_4;
	wire [7:0] pix_5;
	wire [7:0] pix_6;
	wire [7:0] pix_7;
	wire [7:0] pix_8;
	wire [7:0] pix_9;
	wire [7:0] pix_10;
	wire [7:0] pix_11;
	wire [7:0] pix_12;
	wire [7:0] pix_13;
	wire [7:0] pix_14;
	wire [7:0] pix_15;
	wire [7:0] pix_16;
	wire [7:0] pix_17;
	wire [7:0] pix_18;
	wire [7:0] pix_19;
	wire [7:0] pix_20;
	wire [7:0] pix_21;
	wire [7:0] pix_22;
	wire [7:0] pix_23;
	wire [7:0] pix_24;
	wire [7:0] pix_25;
	
	wire iniciar_programa;
	
	
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
		.direccion_siguiente_inst(address_mem_onchip_port_1),
		.programa_leido(iniciar_programa)
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


	
	/*
	 *
	==========================================================================
	CONTEXTO: 
	*
	*/
	control_lecturas_mem_externa control_lecturas_mem_externa_inst
	(
		.clk(clk),
		.reset(reset),
		.iniciar(iniciar_programa), 
		.buf_space_available(space_available_buff_pixels),
		.direccion_mem_inicio_img(direcc_mem_inicio_imagen),
		.lecturas_totales_mem(cantidad_lecturas_mem),
		.lectura_mem_completada(op_complete_mem_offchip_port_1),
		//
		.read_mem(read_mem_offchip_port_1),
		.address_mem(address_mem_offchip_port_1),
		.save_mem_data(save_mem_data_on_buff)
	);
	
	
	defparam control_lecturas_mem_externa_inst.BITS_DIRECCION_MEM = BITS_ADDR_MEM_OFFCHIP;

	
	/*
	 *
	==========================================================================
	CONTEXTO: 
	*
	*/
	buffer_pixeles_mem buffer_pixeles_mem_inst
	(
		.clk(clk),
		.reset(reset),
		.memory_data(data_mem_offchip_port_1),
		.read_pixel(read_pixel_from_buff),
		.save_mem_data(save_mem_data_on_buff),
		//
		.pixel(pixel_on_buff),
		.space_available(space_available_buff_pixels),
		.data_available(data_available_buff_pixeles)
	);	
	
	
	
	
	/*
	 *
	==========================================================================
	CONTEXTO: 
	*
	*/
	ventana_pixeles ventana_pixeles_inst
	(
		.clk(clk),
		.reset(reset),
		.cantidad_buffers_internos(cantidad_buffers_internos),
		.tamano_mascara(tamano_mascara),
		.data_available(data_available_buff_pixeles),
		.iniciar(iniciar_programa ), 
		.pixel_entrada(pixel_on_buff),
		.siguiente_ventana(),
		//
		.read_pixel(read_pixel_from_buff),
		.ventana_valida(ventana_pixeles_valida),
		.pixel_1(pix_1),
		.pixel_2(pix_2),
		.pixel_3(pix_3),
		.pixel_4(pix_4),
		.pixel_5(pix_5),
		.pixel_6(pix_6),
		.pixel_7(pix_7),
		.pixel_8(pix_8),
		.pixel_9(pix_9),
		.pixel_10(pix_10),
		.pixel_11(pix_11),
		.pixel_12(pix_12),
		.pixel_13(pix_13),
		.pixel_14(pix_14),
		.pixel_15(pix_15),
		.pixel_16(pix_16),
		.pixel_17(pix_17),
		.pixel_18(pix_18),
		.pixel_19(pix_19),
		.pixel_20(pix_20),
		.pixel_21(pix_21),
		.pixel_22(pix_22),
		.pixel_23(pix_23),
		.pixel_24(pix_24),
		.pixel_25(pix_25)
	);	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

endmodule






























