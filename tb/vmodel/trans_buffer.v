

module trans_buffer
(
    // Inputs
     output          input_io
    ,input           output_en
    ,input           output_io

    ,inout           inout_io
);

assign inout_io = output_en ? output_io : 1'bz ;

assign input_io = inout_io ;

endmodule
