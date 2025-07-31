module And_Gate_test;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire y;

    // Instantiate the Unit Under Test (UUT)
    And_Gate uut (
        .a(a), 
        .b(b), 
        .y(y)
    );

    initial begin
        // Initialize Inputs
            a=0;b=0;
    #100    a=0;b=1;
    #100    a=1;b=0;
    #100    a=1;b=1;

        
    #100;
        
        // Add stimulus here

    end
      
endmodule
    
