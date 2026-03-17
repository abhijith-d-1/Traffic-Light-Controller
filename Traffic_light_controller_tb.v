module Traffic_light_controller_tb;
    reg clk, rst;
    wire red, green, yellow;

    Traffic_light_controller dut(
        .clk(clk), 
        .rst(rst), 
        .red(red), 
        .green(green), 
        .yellow(yellow)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("Traffic_light_controller.vcd");
        $dumpvars(0, Traffic_light_controller_tb);
    end

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        #20 rst = 1'b0;   // Release reset
        #2000 $finish;    // Run long enough for full cycles
    end 
    
    initial $monitor("%0t: rst=%b state=%b Timer=%d R=%b G=%b Y=%b", 
                     $time, rst, dut.state, dut.Timer, red, green, yellow);
endmodule
