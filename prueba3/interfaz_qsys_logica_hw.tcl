# TCL File Generated by Component Editor 15.1
# Mon Oct 17 20:29:04 CST 2016
# DO NOT MODIFY


# 
# interfaz_qsys_logica "interfaz_qsys_logica" v1.0
#  2016.10.17.20:29:04
# 
# 

# 
# request TCL package from ACDS 15.1
# 
package require -exact qsys 15.1


# 
# module interfaz_qsys_logica
# 
set_module_property DESCRIPTION ""
set_module_property NAME interfaz_qsys_logica
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME interfaz_qsys_logica
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL interfaz_qsys_logica
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file interfaz_qsys_logica.v VERILOG PATH source_code/interfaz_qsys_logica.v TOP_LEVEL_FILE
add_fileset_file FlipFlopD_Habilitado.v VERILOG PATH source_code/FlipFlopD_Habilitado.v
add_fileset_file control_mascara.v VERILOG PATH source_code/control_mascara.v
add_fileset_file control_ventana.v VERILOG PATH source_code/control_ventana.v
add_fileset_file program_counter.v VERILOG PATH source_code/program_counter.v
add_fileset_file registro_sumador.v VERILOG PATH source_code/registro_sumador.v
add_fileset_file registro_sumador_dinamico.v VERILOG PATH source_code/registro_sumador_dinamico.v
add_fileset_file control_lecturas_mem_externa.v VERILOG PATH source_code/control_lecturas_mem_externa.v
add_fileset_file buffer_pixeles_mem.v VERILOG PATH source_code/buffer_pixeles_mem.v
add_fileset_file registro_desplazador_izq.v VERILOG PATH source_code/registro_desplazador_izq.v
add_fileset_file fifo_8w_8b.v VERILOG PATH IP_cores/fifo_8w_8b.v
add_fileset_file mux_2_1.v VERILOG PATH source_code/mux_2_1.v
add_fileset_file buffer_fifo_configurable.v VERILOG PATH source_code/buffer_fifo_configurable.v
add_fileset_file buffer_unidad.v VERILOG PATH source_code/buffer_unidad.v
add_fileset_file fifo_256w_8b.v VERILOG PATH IP_cores/fifo_256w_8b.v
add_fileset_file ventana_pixeles.v VERILOG PATH source_code/ventana_pixeles.v

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL interfaz_qsys_logica
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file interfaz_qsys_logica.v VERILOG PATH source_code/interfaz_qsys_logica.v
add_fileset_file FlipFlopD_Habilitado.v VERILOG PATH source_code/FlipFlopD_Habilitado.v
add_fileset_file control_mascara.v VERILOG PATH source_code/control_mascara.v
add_fileset_file control_ventana.v VERILOG PATH source_code/control_ventana.v
add_fileset_file program_counter.v VERILOG PATH source_code/program_counter.v
add_fileset_file registro_sumador.v VERILOG PATH source_code/registro_sumador.v
add_fileset_file registro_sumador_dinamico.v VERILOG PATH source_code/registro_sumador_dinamico.v
add_fileset_file control_lecturas_mem_externa.v VERILOG PATH source_code/control_lecturas_mem_externa.v
add_fileset_file buffer_pixeles_mem.v VERILOG PATH source_code/buffer_pixeles_mem.v
add_fileset_file registro_desplazador_izq.v VERILOG PATH source_code/registro_desplazador_izq.v
add_fileset_file fifo_8w_8b.v VERILOG PATH IP_cores/fifo_8w_8b.v
add_fileset_file mux_2_1.v VERILOG PATH source_code/mux_2_1.v
add_fileset_file buffer_fifo_configurable.v VERILOG PATH source_code/buffer_fifo_configurable.v
add_fileset_file buffer_unidad.v VERILOG PATH source_code/buffer_unidad.v
add_fileset_file fifo_256w_8b.v VERILOG PATH IP_cores/fifo_256w_8b.v
add_fileset_file ventana_pixeles.v VERILOG PATH source_code/ventana_pixeles.v


# 
# parameters
# 
add_parameter BITS_MEMORY_DATA INTEGER 32
set_parameter_property BITS_MEMORY_DATA DEFAULT_VALUE 32
set_parameter_property BITS_MEMORY_DATA DISPLAY_NAME BITS_MEMORY_DATA
set_parameter_property BITS_MEMORY_DATA TYPE INTEGER
set_parameter_property BITS_MEMORY_DATA UNITS None
set_parameter_property BITS_MEMORY_DATA ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BITS_MEMORY_DATA HDL_PARAMETER true
add_parameter BITS_ADDR_MEM_ONCHIP INTEGER 14
set_parameter_property BITS_ADDR_MEM_ONCHIP DEFAULT_VALUE 14
set_parameter_property BITS_ADDR_MEM_ONCHIP DISPLAY_NAME BITS_ADDR_MEM_ONCHIP
set_parameter_property BITS_ADDR_MEM_ONCHIP TYPE INTEGER
set_parameter_property BITS_ADDR_MEM_ONCHIP UNITS None
set_parameter_property BITS_ADDR_MEM_ONCHIP ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BITS_ADDR_MEM_ONCHIP HDL_PARAMETER true
add_parameter BITS_ADDR_MEM_OFFCHIP INTEGER 14
set_parameter_property BITS_ADDR_MEM_OFFCHIP DEFAULT_VALUE 14
set_parameter_property BITS_ADDR_MEM_OFFCHIP DISPLAY_NAME BITS_ADDR_MEM_OFFCHIP
set_parameter_property BITS_ADDR_MEM_OFFCHIP TYPE INTEGER
set_parameter_property BITS_ADDR_MEM_OFFCHIP UNITS None
set_parameter_property BITS_ADDR_MEM_OFFCHIP ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BITS_ADDR_MEM_OFFCHIP HDL_PARAMETER true
add_parameter BITS_BUS_DIRECCION_INSTR INTEGER 8
set_parameter_property BITS_BUS_DIRECCION_INSTR DEFAULT_VALUE 8
set_parameter_property BITS_BUS_DIRECCION_INSTR DISPLAY_NAME BITS_BUS_DIRECCION_INSTR
set_parameter_property BITS_BUS_DIRECCION_INSTR TYPE INTEGER
set_parameter_property BITS_BUS_DIRECCION_INSTR UNITS None
set_parameter_property BITS_BUS_DIRECCION_INSTR ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BITS_BUS_DIRECCION_INSTR HDL_PARAMETER true
add_parameter BITS_BUS_DATOS_INSTR INTEGER 24
set_parameter_property BITS_BUS_DATOS_INSTR DEFAULT_VALUE 24
set_parameter_property BITS_BUS_DATOS_INSTR DISPLAY_NAME BITS_BUS_DATOS_INSTR
set_parameter_property BITS_BUS_DATOS_INSTR TYPE INTEGER
set_parameter_property BITS_BUS_DATOS_INSTR UNITS None
set_parameter_property BITS_BUS_DATOS_INSTR ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BITS_BUS_DATOS_INSTR HDL_PARAMETER true
add_parameter BITS_ELEMENTO_MASCARA INTEGER 10
set_parameter_property BITS_ELEMENTO_MASCARA DEFAULT_VALUE 10
set_parameter_property BITS_ELEMENTO_MASCARA DISPLAY_NAME BITS_ELEMENTO_MASCARA
set_parameter_property BITS_ELEMENTO_MASCARA TYPE INTEGER
set_parameter_property BITS_ELEMENTO_MASCARA UNITS None
set_parameter_property BITS_ELEMENTO_MASCARA ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BITS_ELEMENTO_MASCARA HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point conduit_instrucciones
# 
add_interface conduit_instrucciones conduit end
set_interface_property conduit_instrucciones associatedClock clock
set_interface_property conduit_instrucciones associatedReset reset
set_interface_property conduit_instrucciones ENABLED true
set_interface_property conduit_instrucciones EXPORT_OF ""
set_interface_property conduit_instrucciones PORT_NAME_MAP ""
set_interface_property conduit_instrucciones CMSIS_SVD_VARIABLES ""
set_interface_property conduit_instrucciones SVD_ADDRESS_GROUP ""

add_interface_port conduit_instrucciones address_mem_onchip_port_1 direccion Output BITS_ADDR_MEM_ONCHIP
add_interface_port conduit_instrucciones data_mem_onchip_port_1 datos_leidos Input BITS_MEMORY_DATA
add_interface_port conduit_instrucciones op_complete_mem_onchip_port_1 transaccion_completada Input 1
add_interface_port conduit_instrucciones write_data_mem_onchip_port_1 datos_escribir Output BITS_MEMORY_DATA
add_interface_port conduit_instrucciones write_mem_onchip_port_1 escribir Output 1
add_interface_port conduit_instrucciones read_mem_onchip_port_1 leer Output 1


# 
# connection point conduit_mascara
# 
add_interface conduit_mascara conduit end
set_interface_property conduit_mascara associatedClock clock
set_interface_property conduit_mascara associatedReset reset
set_interface_property conduit_mascara ENABLED true
set_interface_property conduit_mascara EXPORT_OF ""
set_interface_property conduit_mascara PORT_NAME_MAP ""
set_interface_property conduit_mascara CMSIS_SVD_VARIABLES ""
set_interface_property conduit_mascara SVD_ADDRESS_GROUP ""

add_interface_port conduit_mascara address_mem_onchip_port_2 direccion Output BITS_ADDR_MEM_ONCHIP
add_interface_port conduit_mascara data_mem_onchip_port_2 datos_leidos Input BITS_MEMORY_DATA
add_interface_port conduit_mascara op_complete_mem_onchip_port_2 transaccion_completada Input 1
add_interface_port conduit_mascara read_mem_onchip_port_2 leer Output 1
add_interface_port conduit_mascara write_data_mem_onchip_port_2 datos_escribir Output BITS_MEMORY_DATA
add_interface_port conduit_mascara write_mem_onchip_port_2 escribir Output 1


# 
# connection point conduit_imagen
# 
add_interface conduit_imagen conduit end
set_interface_property conduit_imagen associatedClock clock
set_interface_property conduit_imagen associatedReset reset
set_interface_property conduit_imagen ENABLED true
set_interface_property conduit_imagen EXPORT_OF ""
set_interface_property conduit_imagen PORT_NAME_MAP ""
set_interface_property conduit_imagen CMSIS_SVD_VARIABLES ""
set_interface_property conduit_imagen SVD_ADDRESS_GROUP ""

add_interface_port conduit_imagen op_complete_mem_offchip_port_1 transaccion_completada Input 1
add_interface_port conduit_imagen data_mem_offchip_port_1 datos_leidos Input BITS_MEMORY_DATA
add_interface_port conduit_imagen read_mem_offchip_port_1 leer Output 1
add_interface_port conduit_imagen write_mem_offchip_port_1 escribir Output 1
add_interface_port conduit_imagen write_data_mem_offchip_port_1 datos_escribir Output BITS_MEMORY_DATA
add_interface_port conduit_imagen address_mem_offchip_port_1 direccion Output BITS_ADDR_MEM_OFFCHIP


# 
# connection point conduit_general
# 
add_interface conduit_general conduit end
set_interface_property conduit_general associatedClock clock
set_interface_property conduit_general associatedReset reset
set_interface_property conduit_general ENABLED true
set_interface_property conduit_general EXPORT_OF ""
set_interface_property conduit_general PORT_NAME_MAP ""
set_interface_property conduit_general CMSIS_SVD_VARIABLES ""
set_interface_property conduit_general SVD_ADDRESS_GROUP ""

add_interface_port conduit_general iniciar_lectura_instrucciones iniciar Input 1

