altgxb_reconfig	altgxb_reconfig_inst (
	.offset_cancellation_reset ( offset_cancellation_reset_sig ),
	.reconfig_clk ( reconfig_clk_sig ),
	.reconfig_data ( reconfig_data_sig ),
	.reconfig_fromgxb ( reconfig_fromgxb_sig ),
	.reconfig_reset ( reconfig_reset_sig ),
	.write_all ( write_all_sig ),
	.busy ( busy_sig ),
	.channel_reconfig_done ( channel_reconfig_done_sig ),
	.reconfig_address_out ( reconfig_address_out_sig ),
	.reconfig_togxb ( reconfig_togxb_sig )
	);
