function A = recon(Z)
    global h1
    global h2
    global g1
    global g2
    [rows,columns,channels] = size(Z);
    
    row_offset = 1;
    column_offset = 0;
    A = synthesis_filter_column(Z,rows/16,columns/16,row_offset,column_offset,h2,g2);

    row_offset = rows/16+1;
    column_offset = 0;
    A = synthesis_filter_column(A,rows/16,columns/16,row_offset,column_offset,h2,g2);

    row_offset = 0;
    column_offset = 1;
    A = synthesis_filter_row(A,rows/16,columns/8,row_offset,column_offset,h2,g2);



    row_offset = 1;
    column_offset = 0;
    A = synthesis_filter_column(A,rows/8,columns/8,row_offset,column_offset,h2,g2);

    row_offset = rows/8 +1;
    column_offset = 0;
    A = synthesis_filter_column(A,rows/8,columns/8,row_offset,column_offset,h2,g2);

    row_offset = 0;
    column_offset = 1;
    A = synthesis_filter_row(A,rows/8,columns/4,row_offset,column_offset,h2,g2);



    row_offset = 1;
    column_offset = 0;
    A = synthesis_filter_column(A,rows/4,columns/4,row_offset,column_offset,h2,g2);

    row_offset = rows/4 +1;
    column_offset = 0;
    A = synthesis_filter_column(A,rows/4,columns/4,row_offset,column_offset,h2,g2);

    row_offset = 0;
    column_offset = 1;
    A = synthesis_filter_row(A,rows/4,columns/2,row_offset,column_offset,h2,g2);


 
    row_offset = 1;
    column_offset = columns/2;
    A = synthesis_filter_column(A,rows/4,columns/4,row_offset,column_offset,h2,g2);

    row_offset = rows/4+1;
    column_offset = columns/2;
    A = synthesis_filter_column(A,rows/4,columns/4,row_offset,column_offset,h2,g2);


    row_offset = 0;
    column_offset = columns/2+1;
    A = synthesis_filter_row(A,rows/4,columns/2,row_offset,column_offset,h2,g2);

    % LOWER LEFT HAND CORNER%
    row_offset = rows/2+1;
    column_offset = 0;
    A = synthesis_filter_column(A,rows/4,columns/4,row_offset,column_offset,h2,g2);

    row_offset = rows/2 + rows/4+1;
    column_offset = 0;
    A = synthesis_filter_column(A,rows/4,columns/4,row_offset,column_offset,h2,g2);

    row_offset = rows/2;
    column_offset = 1;
    A = synthesis_filter_row(A,rows/4,columns/2,row_offset,column_offset,h2,g2);




        %SYN OF LOWER RIGHT HAND CORNER%
    row_offset = rows/2+1;
    column_offset = columns/2;
    A = synthesis_filter_column(A,rows/4,columns/4,row_offset,column_offset,h2,g2); 


    row_offset = rows/2 + rows/4+1;
    column_offset = columns/2;
    A = synthesis_filter_column(A,rows/4,columns/4,row_offset,column_offset,h2,g2);


    row_offset = rows/2;
    column_offset = columns/2+1;
    A = synthesis_filter_row(A,rows/4,columns/2,row_offset,column_offset,h2,g2);


    % SYN OF ENTIRE IMAGE%
    row_offset = 1;
    column_offset = 0;
    A = synthesis_filter_column(A,rows/2,columns/2,row_offset,column_offset,h2,g2);

    row_offset = rows/2+1;
    column_offset = 0;
    A = synthesis_filter_column(A,rows/2,columns/2,row_offset,column_offset,h2,g2);

    row_offset = 0;
    column_offset = 1;
    A = synthesis_filter_row(A,rows/2,columns,row_offset,column_offset,h2,g2);
end
