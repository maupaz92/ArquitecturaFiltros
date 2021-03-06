# TCL File Generated by Component Editor 15.1
# Sun Jun 19 20:36:57 CST 2016
# DO NOT MODIFY


# 
# logic "logic" v1.0
#  2016.06.19.20:36:57
# 
# 

# 
# request TCL package from ACDS 15.1
# 
package require -exact qsys 15.1


# 
# module logic
# 
set_module_property DESCRIPTION ""
set_module_property NAME logic
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME logic
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL ../logica/top_logic
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file top_logic.v VERILOG PATH ../logica/top_logic.v TOP_LEVEL_FILE
add_fileset_file FSM_control_llenado_ventana.v VERILOG PATH ../logica/FSM_control_llenado_ventana.v
add_fileset_file FSM_control_pixeles.v VERILOG PATH ../logica/FSM_control_pixeles.v
add_fileset_file FlipFlopD_Habilitado.v VERILOG PATH ../logica/FlipFlopD_Habilitado.v
add_fileset_file comparador_bytes_filas.v VERILOG PATH ../logica/comparador_bytes_filas.v
add_fileset_file comparador_mayor_5_bytes.v VERILOG PATH ../logica/comparador_mayor_5_bytes.v
add_fileset_file comparador_num_mayor.v VERILOG PATH ../logica/comparador_num_mayor.v
add_fileset_file contador_pulsos.v VERILOG PATH ../logica/contador_pulsos.v
add_fileset_file deco_seleccion_byte.v VERILOG PATH ../logica/deco_seleccion_byte.v
add_fileset_file divisor.v VERILOG PATH ../logica/divisor.v
add_fileset_file manejo_ventana.v VERILOG PATH ../logica/manejo_ventana.v
add_fileset_file mux_2_1.v VERILOG PATH ../logica/mux_2_1.v
add_fileset_file registro_sumador.v VERILOG PATH ../logica/registro_sumador.v
add_fileset_file shift_bits_left.v VERILOG PATH ../logica/shift_bits_left.v
add_fileset_file ventana_5x8.v VERILOG PATH ../logica/ventana_5x8.v
add_fileset_file FSM_control_pos_memoria.v VERILOG PATH ../logica/FSM_control_pos_memoria.v
add_fileset_file FSM_liberar_bus.v VERILOG PATH ../logica/FSM_liberar_bus.v
add_fileset_file seleccion_pos_mem.v VERILOG PATH ../logica/seleccion_pos_mem.v
add_fileset_file FSM_control_actualizacion_filas.v VERILOG PATH ../logica/FSM_control_actualizacion_filas.v
add_fileset_file registro_ventana.v VERILOG PATH ../logica/registro_ventana.v
add_fileset_file FSM_control_escritura.v VERILOG PATH ../logica/FSM_control_escritura.v
add_fileset_file registro_sumador_dinamico.v VERILOG PATH ../logica/registro_sumador_dinamico.v
add_fileset_file mux_16_1.v VERILOG PATH ../logica/mux_16_1.v

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL ../logica/top_logic
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file top_logic.v VERILOG PATH ../logica/top_logic.v
add_fileset_file FSM_control_llenado_ventana.v VERILOG PATH ../logica/FSM_control_llenado_ventana.v
add_fileset_file FSM_control_pixeles.v VERILOG PATH ../logica/FSM_control_pixeles.v
add_fileset_file FlipFlopD_Habilitado.v VERILOG PATH ../logica/FlipFlopD_Habilitado.v
add_fileset_file comparador_bytes_filas.v VERILOG PATH ../logica/comparador_bytes_filas.v
add_fileset_file comparador_mayor_5_bytes.v VERILOG PATH ../logica/comparador_mayor_5_bytes.v
add_fileset_file comparador_num_mayor.v VERILOG PATH ../logica/comparador_num_mayor.v
add_fileset_file contador_pulsos.v VERILOG PATH ../logica/contador_pulsos.v
add_fileset_file deco_seleccion_byte.v VERILOG PATH ../logica/deco_seleccion_byte.v
add_fileset_file divisor.v VERILOG PATH ../logica/divisor.v
add_fileset_file manejo_ventana.v VERILOG PATH ../logica/manejo_ventana.v
add_fileset_file mux_2_1.v VERILOG PATH ../logica/mux_2_1.v
add_fileset_file registro_sumador.v VERILOG PATH ../logica/registro_sumador.v
add_fileset_file shift_bits_left.v VERILOG PATH ../logica/shift_bits_left.v
add_fileset_file ventana_5x8.v VERILOG PATH ../logica/ventana_5x8.v
add_fileset_file FSM_control_pos_memoria.v VERILOG PATH ../logica/FSM_control_pos_memoria.v
add_fileset_file FSM_liberar_bus.v VERILOG PATH ../logica/FSM_liberar_bus.v
add_fileset_file seleccion_pos_mem.v VERILOG PATH ../logica/seleccion_pos_mem.v
add_fileset_file FSM_control_actualizacion_filas.v VERILOG PATH ../logica/FSM_control_actualizacion_filas.v
add_fileset_file registro_ventana.v VERILOG PATH ../logica/registro_ventana.v
add_fileset_file FSM_control_escritura.v VERILOG PATH ../logica/FSM_control_escritura.v
add_fileset_file registro_sumador_dinamico.v VERILOG PATH ../logica/registro_sumador_dinamico.v
add_fileset_file mux_16_1.v VERILOG PATH ../logica/mux_16_1.v


# 
# parameters
# 
add_parameter BITS_DIRECCION_P1 INTEGER 17
set_parameter_property BITS_DIRECCION_P1 DEFAULT_VALUE 17
set_parameter_property BITS_DIRECCION_P1 DISPLAY_NAME BITS_DIRECCION_P1
set_parameter_property BITS_DIRECCION_P1 TYPE INTEGER
set_parameter_property BITS_DIRECCION_P1 UNITS None
set_parameter_property BITS_DIRECCION_P1 ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BITS_DIRECCION_P1 HDL_PARAMETER true
add_parameter BITS_DIRECCION_P2 INTEGER 17
set_parameter_property BITS_DIRECCION_P2 DEFAULT_VALUE 17
set_parameter_property BITS_DIRECCION_P2 DISPLAY_NAME BITS_DIRECCION_P2
set_parameter_property BITS_DIRECCION_P2 TYPE INTEGER
set_parameter_property BITS_DIRECCION_P2 UNITS None
set_parameter_property BITS_DIRECCION_P2 ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BITS_DIRECCION_P2 HDL_PARAMETER true
add_parameter BITS_PALABRA INTEGER 64
set_parameter_property BITS_PALABRA DEFAULT_VALUE 64
set_parameter_property BITS_PALABRA DISPLAY_NAME BITS_PALABRA
set_parameter_property BITS_PALABRA TYPE INTEGER
set_parameter_property BITS_PALABRA UNITS None
set_parameter_property BITS_PALABRA ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BITS_PALABRA HDL_PARAMETER true
add_parameter BITS_DATOS INTEGER 8
set_parameter_property BITS_DATOS DEFAULT_VALUE 8
set_parameter_property BITS_DATOS DISPLAY_NAME BITS_DATOS
set_parameter_property BITS_DATOS TYPE INTEGER
set_parameter_property BITS_DATOS UNITS None
set_parameter_property BITS_DATOS ALLOWED_RANGES -2147483648:2147483647
set_parameter_property BITS_DATOS HDL_PARAMETER true


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
# connection point control_usuario
# 
add_interface control_usuario conduit end
set_interface_property control_usuario associatedClock clock
set_interface_property control_usuario associatedReset reset
set_interface_property control_usuario ENABLED true
set_interface_property control_usuario EXPORT_OF ""
set_interface_property control_usuario PORT_NAME_MAP ""
set_interface_property control_usuario CMSIS_SVD_VARIABLES ""
set_interface_property control_usuario SVD_ADDRESS_GROUP ""

add_interface_port control_usuario iniciar iniciar Input 1


# 
# connection point control_puerto_mem1
# 
add_interface control_puerto_mem1 conduit end
set_interface_property control_puerto_mem1 associatedClock clock
set_interface_property control_puerto_mem1 associatedReset reset
set_interface_property control_puerto_mem1 ENABLED true
set_interface_property control_puerto_mem1 EXPORT_OF ""
set_interface_property control_puerto_mem1 PORT_NAME_MAP ""
set_interface_property control_puerto_mem1 CMSIS_SVD_VARIABLES ""
set_interface_property control_puerto_mem1 SVD_ADDRESS_GROUP ""

add_interface_port control_puerto_mem1 datos_escribir_port1 datos_escribir Output BITS_PALABRA
add_interface_port control_puerto_mem1 datos_leidos_port1 datos_leidos Input BITS_PALABRA
add_interface_port control_puerto_mem1 direccion_port1 direccion Output BITS_DIRECCION_P1
add_interface_port control_puerto_mem1 escribir_port1 escribir Output 1
add_interface_port control_puerto_mem1 leer_port1 leer Output 1
add_interface_port control_puerto_mem1 transaccion_completada_port1 transaccion_completada Input 1


# 
# connection point control_puerto_mem2
# 
add_interface control_puerto_mem2 conduit end
set_interface_property control_puerto_mem2 associatedClock clock
set_interface_property control_puerto_mem2 associatedReset reset
set_interface_property control_puerto_mem2 ENABLED true
set_interface_property control_puerto_mem2 EXPORT_OF ""
set_interface_property control_puerto_mem2 PORT_NAME_MAP ""
set_interface_property control_puerto_mem2 CMSIS_SVD_VARIABLES ""
set_interface_property control_puerto_mem2 SVD_ADDRESS_GROUP ""

add_interface_port control_puerto_mem2 datos_leidos_port2 datos_leidos Input BITS_PALABRA
add_interface_port control_puerto_mem2 transaccion_completada_port2 transaccion_completada Input 1
add_interface_port control_puerto_mem2 leer_port2 leer Output 1
add_interface_port control_puerto_mem2 direccion_port2 direccion Output BITS_DIRECCION_P2
add_interface_port control_puerto_mem2 escribir_port2 escribir Output 1
add_interface_port control_puerto_mem2 datos_escribir_port2 datos_escribir Output BITS_PALABRA

