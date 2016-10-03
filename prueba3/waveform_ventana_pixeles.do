onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ventana_pixeles_TEST/clk
add wave -noupdate /ventana_pixeles_TEST/reset
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/pixel_entrada
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/buffers_internos
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/tamano_mascara
add wave -noupdate /ventana_pixeles_TEST/data_available
add wave -noupdate /ventana_pixeles_TEST/iniciar
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate /ventana_pixeles_TEST/read_pixel
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/ventana_valida
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/buffer_1/buffer_1/data_in_buffer
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/buffer_2/buffer_1/data_in_buffer
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/data_buff_5
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/data_buff_4
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/data_buff_3
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/data_buff_3_intern_short
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/data_buff_3_intern_large
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/data_buff_2
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/data_buff_1
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/data_to_buff_4
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/data_to_buff_3
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/data_to_buff_2
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/data_to_buff_1
add wave -noupdate -divider {New Divider}
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/buffer_full_5
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/buffer_full_4
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/buffer_full_3
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/buffer_full_3_large
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/buffer_full_3_short
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/buffer_full_2
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/buffer_full_1
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/llenado_buffers_completo
add wave -noupdate -divider {New Divider}
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/ventana_grande
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_leido
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/guardar_pixel
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/indice_buffer_actual
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/habilitador_buffer_llenado
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/habilitar_siguiente_buffer
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/guardar_configuracion_buffers
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/habilitacion_muxes_actual
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/habilitacion_muxes_siguiente
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/actualizar_habilitacion_muxes
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/buffer_fullness_actual
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/conteo_ventanas_desplazadas
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/contar_ventana_desplazadas
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/pop_pixeles_buffers
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/habilitacion_registros_ventana
add wave -noupdate /ventana_pixeles_TEST/ventana_pixeles_inst/push_datos_buffers
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/e_actual
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/e_siguiente
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_1
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_2
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_3
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_4
add wave -noupdate -radix unsigned -childformat {{{/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[7]} -radix unsigned} {{/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[6]} -radix unsigned} {{/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[5]} -radix unsigned} {{/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[4]} -radix unsigned} {{/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[3]} -radix unsigned} {{/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[2]} -radix unsigned} {{/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[1]} -radix unsigned} {{/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[0]} -radix unsigned}} -subitemconfig {{/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[7]} {-height 15 -radix unsigned} {/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[6]} {-height 15 -radix unsigned} {/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[5]} {-height 15 -radix unsigned} {/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[4]} {-height 15 -radix unsigned} {/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[3]} {-height 15 -radix unsigned} {/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[2]} {-height 15 -radix unsigned} {/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[1]} {-height 15 -radix unsigned} {/ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5[0]} {-height 15 -radix unsigned}} /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_5
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_6
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_7
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_8
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_9
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_10
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_11
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_12
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_13
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_14
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_15
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_16
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_17
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_18
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_19
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_20
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_21
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_22
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_23
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_24
add wave -noupdate -radix unsigned /ventana_pixeles_TEST/ventana_pixeles_inst/pixel_25
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {21957699 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 526
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 20000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {21780800 ps} {22116800 ps}
