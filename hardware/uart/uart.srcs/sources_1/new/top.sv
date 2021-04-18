`timescale 1ns / 1ps

// implemented using this https://www.edaplayground.com/x/4Lyz
module top (
  input i_clk , i_serial,
  output o_led0
);

wire rx_data_ok;
wire [7:0] rx_data;

// receiver module
uart_rx #(
  // 33_000_000 / 115200 = 286,458 )
  .CLKS_PER_BIT(286)
)
inst_uart_rx(
  .i_clk(i_clk),
  .i_serial(i_serial),
  .o_data(rx_data),
  .o_data_ok(rx_data_ok)
);

assign o_led0 = (rx_data_ok == 1'b1) ? rx_data[7:4] : 0;
endmodule

// uart receaver for led control
module uart_rx
#( parameter CLKS_PER_BIT = 0)
( input
  i_clk,
  i_serial,
  output
    [7:0] o_data,
    o_data_ok
);

parameter
  DATA_BITS = 8,
  IDLE  = 3'b000,
  START = 3'b001,
  DATA  = 3'b010,
  STOP  = 3'b011,
  DONE = 3'b100;

reg [DATA_BITS-1:0] clk_cnt = 0;
reg [DATA_BITS-1:0] data = 0;
reg [2:0] bit_index = 0;
reg [2:0] state = 0;
reg data_ok = 0;

always @(posedge i_clk) begin
  case (state)
    // the idle state of the state machine
    IDLE: begin
      data_ok <= 1'b0;
      clk_cnt <= 0;
      bit_index <= 0;
      if(i_serial == 1'b0)
        state <= START;
      else
        state <= IDLE;
    end

    // the start state of the state machine
    START: begin
      // finding the middle to have good data
      if (clk_cnt == (CLKS_PER_BIT-1)/2) begin
        if(i_serial == 1'b0) begin
          clk_cnt <= 0;
          state <= DATA;
        end
        else state <= IDLE;
      end
      else
        clk_cnt <= clk_cnt +1;
        state <= START;
    end


    // Wait CLKS_PER_BIT-1 clock cycles to sample serial data
    DATA: begin
      if (clk_cnt < CLKS_PER_BIT-1) begin
        clk_cnt <= clk_cnt + 1;
        state <= DATA;
      end else begin
        // fill up data correctly from i_serial input
        // with circling around from DATA TO DATA
        clk_cnt <= 0;
        data[bit_index] <= i_serial;
        if(bit_index < 7) begin
          bit_index <= bit_index +1;
          state <= DATA;
        end else begin
          bit_index <= 0;
          state <= STOP;
        end
      end
    end

    // reading stop bit for transmission
    // when done go to DONE and set transmission
    // to success
    STOP: begin
      if (clk_cnt < CLKS_PER_BIT-1) begin
        clk_cnt <= clk_cnt + 1;
        state <= STOP;
      end else begin
        data_ok <= 1'b1;
        clk_cnt <= 0;
        state <= DONE;
      end
    end

    // when done go back to idle
    // and reset transmission status
    DONE: begin
      data_ok <= 1'b0;
      state <= IDLE;
    end

    // default to idle state
    default:
      state <= IDLE;

  endcase
end

// make output ready
assign o_data_ok = data_ok;
assign o_data = data;

endmodule

