module traffic_light_controller (
    input clk,
    input rst,
    output reg [1:0] main_light,  // 00=Red, 01=Yellow, 10=Green
    output reg [1:0] side_light   // 00=Red, 01=Yellow, 10=Green
);

    // State encoding
    typedef enum logic [2:0] {
        MAIN_GREEN   = 3'b000,
        MAIN_YELLOW  = 3'b001,
        SIDE_GREEN   = 3'b010,
        SIDE_YELLOW  = 3'b011
    } state_t;

    state_t current_state, next_state;

    // Timer
    reg [3:0] timer;

    // State transition
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= MAIN_GREEN;
            timer <= 0;
        end else begin
            if (timer == 4'd9) begin  // 10 clock cycles per state
                current_state <= next_state;
                timer <= 0;
            end else begin
                timer <= timer + 1;
            end
        end
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            MAIN_GREEN:   next_state = MAIN_YELLOW;
            MAIN_YELLOW:  next_state = SIDE_GREEN;
            SIDE_GREEN:   next_state = SIDE_YELLOW;
            SIDE_YELLOW:  next_state = MAIN_GREEN;
            default:      next_state = MAIN_GREEN;
        endcase
    end

    // Output logic
    always @(*) begin
        case (current_state)
            MAIN_GREEN: begin
                main_light = 2'b10;  // Green
                side_light = 2'b00;  // Red
            end
            MAIN_YELLOW: begin
                main_light = 2'b01;  // Yellow
                side_light = 2'b00;  // Red
            end
            SIDE_GREEN: begin
                main_light = 2'b00;  // Red
                side_light = 2'b10;  // Green
            end
            SIDE_YELLOW: begin
                main_light = 2'b00;  // Red
                side_light = 2'b01;  // Yellow
            end
            default: begin
                main_light = 2'b00;
                side_light = 2'b00;
            end
        endcase
    end
endmodule
