
`timescale 1 ps / 1 ps

module prueba_3(

   refclk,
   free_50MHz,
   pcie_rstn,
	
	botones,
	
	//
	leds,
	
   rx_in0,
   tx_out0
	
);


//=========================================================================

  input  refclk;
  input  free_50MHz;
  input  pcie_rstn;
  input   rx_in0;
  input [3:0] botones;
  //
  output [3:0] leds;
  output  tx_out0;

//=========================================================================
  
  wire reconfig_gxbclk_clk;
  wire fixedclk;
  wire [4:0]  reconfig_fromgxb_0_data;
  wire busy_altgxb_reconfig;
  wire [3:0]  reconfig_togxb_data;
  wire pll_locked;
  

//=========================================================================
  
	qsys u0 (
		.button_external_connection_export          (botones),
		.led_external_connection_export             (leds),
		
		
		.pcie_ip_clocks_sim_clk250_export           (),
		.pcie_ip_clocks_sim_clk500_export           (),
		.pcie_ip_clocks_sim_clk125_export           (),
		
		.pcie_ip_pcie_rstn_export                   (pcie_rstn),
		
		.pcie_ip_pipe_ext_pipe_mode                 (),
		.pcie_ip_pipe_ext_phystatus_ext             (),
		.pcie_ip_pipe_ext_rate_ext                  (),
		.pcie_ip_pipe_ext_powerdown_ext             (),
		.pcie_ip_pipe_ext_txdetectrx_ext            (),
		.pcie_ip_pipe_ext_rxelecidle0_ext           (),
		.pcie_ip_pipe_ext_rxdata0_ext               (),
		.pcie_ip_pipe_ext_rxstatus0_ext             (),
		.pcie_ip_pipe_ext_rxvalid0_ext              (),
		.pcie_ip_pipe_ext_rxdatak0_ext              (),
		.pcie_ip_pipe_ext_txdata0_ext               (),
		.pcie_ip_pipe_ext_txdatak0_ext              (),
		.pcie_ip_pipe_ext_rxpolarity0_ext           (),
		.pcie_ip_pipe_ext_txcompl0_ext              (),
		.pcie_ip_pipe_ext_txelecidle0_ext           (),
		.pcie_ip_reconfig_busy_busy_altgxb_reconfig (busy_altgxb_reconfig),
		
		.pcie_ip_reconfig_fromgxb_0_data            (reconfig_fromgxb_0_data),
		
		.pcie_ip_reconfig_togxb_data                (reconfig_togxb_data),
		
		.pcie_ip_refclk_export                      (refclk),
		.pcie_ip_rx_in_rx_datain_0                  (rx_in0),
		
		.pcie_ip_test_in_test_in                    (),
		
		.pcie_ip_tx_out_tx_dataout_0                (tx_out0),
		.pcie_ip_cal_blk_clk_clk                    (reconfig_gxbclk_clk),
		
		.pcie_ip_powerdown_pll_powerdown            (),
		.pcie_ip_powerdown_gxb_powerdown            (),
		
		.pcie_ip_reconfig_gxbclk_clk                (reconfig_gxbclk_clk),
		.pcie_ip_fixedclk_clk                       (fixedclk)
		
	);  


//=========================================================================

	gpll_i gpll (
			  .areset     (!pcie_rstn),
			  .inclk0     (free_50MHz),
			  //
			  .c0         (reconfig_gxbclk_clk),
			  .c1         (fixedclk),
			  .locked     (pll_locked)
	);


//=========================================================================

	altgxb_reconfig altgxb_reconfig_i (
		
		.offset_cancellation_reset (!pll_locked),
		.reconfig_clk (reconfig_gxbclk_clk),
		.reconfig_data(),
		.reconfig_fromgxb(reconfig_fromgxb_0_data),
		.reconfig_reset (),
		.write_all (),
		//
		.busy (busy_altgxb_reconfig),
		.channel_reconfig_done (),
		.reconfig_address_out (),
		.reconfig_togxb (reconfig_togxb_data)	
	);

	
  
//=========================================================================

  
  
  

endmodule
