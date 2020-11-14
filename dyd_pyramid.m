function B = dyd_pyramid(Y)
    global h1
    global h2
    global g1
    global g2
    [rows,columns,channels] = size(Y);
    
    row_offset = 0;
    column_offset = 1;
    B = analysis_filter_row(Y,rows,columns,row_offset,column_offset,h1,g1);
    row_offset = 1;
    column_offset =0;
    B = analysis_filter_column(B,rows/2,columns,row_offset,column_offset,h1,g1);
    row_offset = rows/2 + 1;
    column_offset =0;
    B = analysis_filter_column(B,rows/2,columns,row_offset,column_offset,h1,g1);
    for i=1:4
        row_offset = 0;
        column_offset = 1;
        B = analysis_filter_row(B,rows/2^i,columns/2^i,row_offset,column_offset,h1,g1);

        row_offset = 1;
        column_offset =0;
        B = analysis_filter_column(B,rows/2^(i+1),columns/2^(i),row_offset,column_offset,h1,g1);

        row_offset = rows/2^(i+1) + 1;
        column_offset =0;
        B = analysis_filter_column(B,rows/2^(i+1),columns/2^(i),row_offset,column_offset,h1,g1);
    end
    
end
