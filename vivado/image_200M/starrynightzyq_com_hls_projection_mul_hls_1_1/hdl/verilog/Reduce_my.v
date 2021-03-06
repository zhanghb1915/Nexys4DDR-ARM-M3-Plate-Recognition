// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Reduce_my (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        src_rows_V_dout,
        src_rows_V_empty_n,
        src_rows_V_read,
        src_cols_V_dout,
        src_cols_V_empty_n,
        src_cols_V_read,
        src_data_stream_V_dout,
        src_data_stream_V_empty_n,
        src_data_stream_V_read,
        Vdst_data_stream_V_din,
        Vdst_data_stream_V_full_n,
        Vdst_data_stream_V_write
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_pp0_stage0 = 5'd8;
parameter    ap_ST_fsm_state8 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] src_rows_V_dout;
input   src_rows_V_empty_n;
output   src_rows_V_read;
input  [31:0] src_cols_V_dout;
input   src_cols_V_empty_n;
output   src_cols_V_read;
input  [7:0] src_data_stream_V_dout;
input   src_data_stream_V_empty_n;
output   src_data_stream_V_read;
output  [15:0] Vdst_data_stream_V_din;
input   Vdst_data_stream_V_full_n;
output   Vdst_data_stream_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg src_rows_V_read;
reg src_cols_V_read;
reg src_data_stream_V_read;
reg Vdst_data_stream_V_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    src_rows_V_blk_n;
reg    src_cols_V_blk_n;
reg    src_data_stream_V_blk_n;
reg    ap_enable_reg_pp0_iter2;
wire    ap_block_pp0_stage0;
reg    Vdst_data_stream_V_blk_n;
reg    ap_enable_reg_pp0_iter3;
reg   [0:0] tmp_13_i_reg_268;
reg   [31:0] t_V_2_reg_160;
reg   [31:0] rows_V_reg_238;
reg    ap_block_state1;
reg   [31:0] cols_V_reg_244;
wire   [32:0] r_V_fu_174_p2;
reg   [32:0] r_V_reg_249;
wire    ap_CS_fsm_state2;
wire   [0:0] exitcond3_i_fu_180_p2;
wire    ap_CS_fsm_state3;
wire   [31:0] i_V_fu_185_p2;
reg   [31:0] i_V_reg_258;
wire   [0:0] tmp_i_40_fu_191_p2;
reg   [0:0] tmp_i_40_reg_263;
wire   [0:0] tmp_13_i_fu_201_p2;
wire   [0:0] exitcond_i_fu_206_p2;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state4_pp0_stage0_iter0;
wire    ap_block_state5_pp0_stage0_iter1;
reg    ap_block_state6_pp0_stage0_iter2;
reg    ap_block_state7_pp0_stage0_iter3;
reg    ap_block_pp0_stage0_11001;
wire   [31:0] j_V_fu_211_p2;
reg    ap_enable_reg_pp0_iter0;
reg   [9:0] dst_buffer_addr_reg_281;
reg   [9:0] dst_buffer_addr_reg_281_pp0_iter1_reg;
reg   [9:0] dst_buffer_addr_reg_281_pp0_iter2_reg;
wire   [15:0] dst_buffer_q0;
reg   [15:0] dst_buffer_load_reg_287;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] tmp_4_fu_232_p2;
reg   [15:0] tmp_4_reg_292;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state4;
wire   [9:0] dst_buffer_address0;
reg    dst_buffer_ce0;
reg    dst_buffer_ce1;
reg    dst_buffer_we1;
reg   [31:0] t_V_reg_149;
wire    ap_CS_fsm_state8;
wire   [63:0] tmp_15_i_fu_217_p1;
reg    ap_block_pp0_stage0_01001;
wire   [32:0] lhs_V_cast_i_fu_171_p1;
wire   [32:0] tmp_12_cast_i_fu_197_p1;
wire   [15:0] storemerge_i_fu_222_p3;
wire   [15:0] tmp_16_i_fu_228_p1;
reg   [4:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

Reduce_my_dst_bufbkb #(
    .DataWidth( 16 ),
    .AddressRange( 640 ),
    .AddressWidth( 10 ))
dst_buffer_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(dst_buffer_address0),
    .ce0(dst_buffer_ce0),
    .q0(dst_buffer_q0),
    .address1(dst_buffer_addr_reg_281_pp0_iter2_reg),
    .ce1(dst_buffer_ce1),
    .we1(dst_buffer_we1),
    .d1(tmp_4_reg_292)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((exitcond3_i_fu_180_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state4) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((exitcond3_i_fu_180_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state4)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state4);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end else if (((exitcond3_i_fu_180_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_i_fu_206_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        t_V_2_reg_160 <= j_V_fu_211_p2;
    end else if (((exitcond3_i_fu_180_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        t_V_2_reg_160 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        t_V_reg_149 <= i_V_reg_258;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        t_V_reg_149 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((src_cols_V_empty_n == 1'b0) | (src_rows_V_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_V_reg_244 <= src_cols_V_dout;
        rows_V_reg_238 <= src_rows_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_i_fu_206_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_buffer_addr_reg_281 <= tmp_15_i_fu_217_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_buffer_addr_reg_281_pp0_iter1_reg <= dst_buffer_addr_reg_281;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        dst_buffer_addr_reg_281_pp0_iter2_reg <= dst_buffer_addr_reg_281_pp0_iter1_reg;
        tmp_4_reg_292 <= tmp_4_fu_232_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_40_reg_263 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_buffer_load_reg_287 <= dst_buffer_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        i_V_reg_258 <= i_V_fu_185_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        r_V_reg_249 <= r_V_fu_174_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond3_i_fu_180_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        tmp_13_i_reg_268 <= tmp_13_i_fu_201_p2;
        tmp_i_40_reg_263 <= tmp_i_40_fu_191_p2;
    end
end

always @ (*) begin
    if (((tmp_13_i_reg_268 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        Vdst_data_stream_V_blk_n = Vdst_data_stream_V_full_n;
    end else begin
        Vdst_data_stream_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_13_i_reg_268 == 1'd1) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        Vdst_data_stream_V_write = 1'b1;
    end else begin
        Vdst_data_stream_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((exitcond_i_fu_206_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state4 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond3_i_fu_180_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond3_i_fu_180_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_buffer_ce0 = 1'b1;
    end else begin
        dst_buffer_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_buffer_ce1 = 1'b1;
    end else begin
        dst_buffer_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_13_i_reg_268 == 1'd0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_buffer_we1 = 1'b1;
    end else begin
        dst_buffer_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_cols_V_blk_n = src_cols_V_empty_n;
    end else begin
        src_cols_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((src_cols_V_empty_n == 1'b0) | (src_rows_V_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_cols_V_read = 1'b1;
    end else begin
        src_cols_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        src_data_stream_V_blk_n = src_data_stream_V_empty_n;
    end else begin
        src_data_stream_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        src_data_stream_V_read = 1'b1;
    end else begin
        src_data_stream_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_rows_V_blk_n = src_rows_V_empty_n;
    end else begin
        src_rows_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((src_cols_V_empty_n == 1'b0) | (src_rows_V_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        src_rows_V_read = 1'b1;
    end else begin
        src_rows_V_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((src_cols_V_empty_n == 1'b0) | (src_rows_V_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((exitcond3_i_fu_180_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((exitcond_i_fu_206_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)) & ~((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((exitcond_i_fu_206_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Vdst_data_stream_V_din = tmp_4_reg_292;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((tmp_13_i_reg_268 == 1'd1) & (1'b0 == Vdst_data_stream_V_full_n) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((src_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((tmp_13_i_reg_268 == 1'd1) & (1'b0 == Vdst_data_stream_V_full_n) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((src_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((tmp_13_i_reg_268 == 1'd1) & (1'b0 == Vdst_data_stream_V_full_n) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((src_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)));
end

always @ (*) begin
    ap_block_state1 = ((src_cols_V_empty_n == 1'b0) | (src_rows_V_empty_n == 1'b0) | (ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state4_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state6_pp0_stage0_iter2 = (src_data_stream_V_empty_n == 1'b0);
end

always @ (*) begin
    ap_block_state7_pp0_stage0_iter3 = ((tmp_13_i_reg_268 == 1'd1) & (1'b0 == Vdst_data_stream_V_full_n));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign dst_buffer_address0 = tmp_15_i_fu_217_p1;

assign exitcond3_i_fu_180_p2 = ((t_V_reg_149 == rows_V_reg_238) ? 1'b1 : 1'b0);

assign exitcond_i_fu_206_p2 = ((t_V_2_reg_160 == cols_V_reg_244) ? 1'b1 : 1'b0);

assign i_V_fu_185_p2 = (t_V_reg_149 + 32'd1);

assign j_V_fu_211_p2 = (t_V_2_reg_160 + 32'd1);

assign lhs_V_cast_i_fu_171_p1 = rows_V_reg_238;

assign r_V_fu_174_p2 = ($signed(lhs_V_cast_i_fu_171_p1) + $signed(33'd8589934591));

assign storemerge_i_fu_222_p3 = ((tmp_i_40_reg_263[0:0] === 1'b1) ? 16'd0 : dst_buffer_load_reg_287);

assign tmp_12_cast_i_fu_197_p1 = t_V_reg_149;

assign tmp_13_i_fu_201_p2 = ((tmp_12_cast_i_fu_197_p1 == r_V_reg_249) ? 1'b1 : 1'b0);

assign tmp_15_i_fu_217_p1 = t_V_2_reg_160;

assign tmp_16_i_fu_228_p1 = src_data_stream_V_dout;

assign tmp_4_fu_232_p2 = (storemerge_i_fu_222_p3 + tmp_16_i_fu_228_p1);

assign tmp_i_40_fu_191_p2 = ((t_V_reg_149 == 32'd0) ? 1'b1 : 1'b0);

endmodule //Reduce_my
