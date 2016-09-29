/*


*/

module interfaz_qsys_logica #(
	parameter BITS_MEMORY_DATA = 32,
	parameter BITS_ADDR_MEM_ONCHIP = 14,
	parameter BITS_ADDR_MEM_OFFCHIP = 14
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





	/*
	 *
	==========================================================================
	CONTEXTO: 
	*
	*/
	program_counter program_counter_inst(
		.clk(clk),
		.reset(reset),
		.iniciar(),
		.reiniciar(),
		.lectura_completada(op_complete_mem_onchip_port_1),
		.instruccion_actual(data_mem_onchip_port_1),
		//
		.leer_siguiente_inst(read_mem_onchip_port_1),
		.direccion_siguiente_inst(address_mem_onchip_port_1)
	);

	defparam program_counter_inst.BITS_DIRECCION_MEMORIA = BITS_ADDR_MEM_ONCHIP;








endmodule










