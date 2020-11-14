function Z = decomp(Y)
    global h1
    global h2
    global g1
    global g2
    [rows,columns,channels] = size(Y);
    %Divide the image into 4 equal-sized subbands 
    row_offset = 0;
    column_offset = 1;
    Z = analysis_filter_row(Y,rows,columns,row_offset,column_offset,h1,g1);
    %imshow(Z);
    row_offset = 1;
    column_offset =0;
    Z = analysis_filter_column(Z,rows/2,columns,row_offset,column_offset,h1,g1);
    %imshow(Z);

    row_offset = rows/2+1;
    column_offset = 0;
    Z = analysis_filter_column(Z,rows/2,columns,row_offset,column_offset,h1,g1);
    %imshow(Z);

    %Further divide each quarter-sized subband into 4 equal-sized subbands 
    row_offset = 0;
    column_offset = 1;
    Z = analysis_filter_row(Z,rows/2,columns/2,row_offset,column_offset,h1,g1);
    %imshow(Z);

    row_offset = 1;
    column_offset = 0;
    Z = analysis_filter_column(Z,rows/4,columns/2,row_offset,column_offset,h1,g1);
    %imshow(Z);

    row_offset = rows/4+1;
    column_offset = 0;
    Z = analysis_filter_column(Z,rows/4,columns/2,row_offset,column_offset,h1,g1);
    %imshow(Z);

    % Filter the upper right hand corner 
    row_offset = 0;
    column_offset = columns/2+1;
    Z = analysis_filter_row(Z,rows/2,columns/2,row_offset,column_offset,h1,g1);
    %imshow(Z)

    row_offset = 1;
    column_offset = columns/2;
    Z = analysis_filter_column(Z,rows/4,columns/2,row_offset,column_offset,h1,g1);
    %imshow(Z)

    row_offset = rows/4+1;
    column_offset = columns/2;
    Z = analysis_filter_column(Z,rows/4,columns/2,row_offset,column_offset,h1,g1);
    %imshow(Z);

    %Filter lower left hand corner 
    row_offset = rows/2;
    column_offset = 1;
    Z = analysis_filter_row(Z,rows/2,columns/2,row_offset,column_offset,h1,g1);
    %imshow(Z);

    row_offset = rows/2+1;
    column_offset = 0;
    Z = analysis_filter_column(Z,rows/4,columns/2,row_offset,column_offset,h1,g1);
    %imshow(Z);

    row_offset = rows/2 + rows/4+1;
    column_offset = 0;
    Z = analysis_filter_column(Z,rows/4,columns/2,row_offset,column_offset,h1,g1);
    %imshow(Z);

    %Filter the lower right hand corner 
    row_offset = rows/2;
    column_offset = columns/2+1;
    Z = analysis_filter_row(Z,rows/2,columns/2,row_offset,column_offset,h1,g1);
    %imshow(Z);

    row_offset = rows/2+1;
    column_offset = columns/2;
    Z = analysis_filter_column(Z,rows/4,columns/2,row_offset,column_offset,h1,g1);
    %imshow(Z);

    row_offset = rows/2 + rows/4+1;
    column_offset = columns/2;
    Z = analysis_filter_column(Z,rows/4,columns/2,row_offset,column_offset,h1,g1);
    %imshow(Z);

    %Further divide lower left-hand subband into 4 subbands creating 19 subbands 

    row_offset = 0;
    column_offset = 1;
    Z = analysis_filter_row(Z,rows/4,columns/4,row_offset,column_offset,h1,g1);
    %imshow(Z);
  
    row_offset = 1;
    column_offset = 0;
    Z = analysis_filter_column(Z,rows/8,columns/4,row_offset,column_offset,h1,g1);
    %imshow(Z);


    row_offset = rows/8+1;
    column_offset = 0;
    Z = analysis_filter_column(Z,rows/8,columns/4,row_offset,column_offset,h1,g1);
    %imshow(Z);

    %Further divide lower left-hand subband into 4 subbands creating 22 subbands 

    row_offset = 0;
    column_offset = 1;
    Z = analysis_filter_row(Z,rows/8,columns/8,row_offset,column_offset,h1,g1);
    %imshow(Z);


    row_offset = 1;
    column_offset = 0;
    Z = analysis_filter_column(Z,rows/16,columns/8,row_offset,column_offset,h1,g1);
    %imshow(Z);

    row_offset = rows/16+1;
    column_offset = 0;
    Z = analysis_filter_column(Z,rows/16,columns/8,row_offset,column_offset,h1,g1);
    imshow(Z);
end












