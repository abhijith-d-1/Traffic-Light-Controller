module Traffic_light_controller(clk, rst, red, yellow, green);

    input clk;
    input rst;
    output reg red, yellow, green;

    parameter RED = 2'b00;
    parameter GREEN = 2'b01;
    parameter YELLOW = 2'b10;

    reg [1:0] state;
    reg [1:0] next_state;
    reg [5:0] Timer;

    always @(posedge clk) begin
        if (rst == 1'b1)  begin
            state <= RED;
            red <= 1'b1; 
            green <= 1'b0; 
            yellow <= 1'b0; 
            Timer <= 6'd25; end
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case (state)
          RED: next_state = (Timer == 0) ? GREEN : RED; 
          GREEN: next_state = (Timer == 0) ? YELLOW : GREEN;
          YELLOW: next_state = (Timer == 0) ? RED : YELLOW;
          default: next_state <= RED;
        endcase
    end

    always @(posedge clk) begin
        case (state) 
        RED: begin
            red <= 1'b1;
            green <= 1'b0;
            yellow <= 1'b0;
            if (Timer == 0) Timer <= 6'd30;      // FIXED: Added reload
            else Timer <= Timer - 1;
        end

        GREEN: begin
            green <= 1'b1;
            red <= 1'b0;
            yellow <= 1'b0;
            if (Timer == 0) Timer <= 6'd6;      // FIXED: Added reload
            else Timer <= Timer - 1;
        end
        
        YELLOW: begin
            yellow <= 1'b1;
            red <= 1'b0;
            green <= 1'b0;
            if (Timer == 0) Timer <= 6'd25;      // FIXED: Added reload
            else Timer <= Timer - 1;
        end
      endcase
    end

endmodule