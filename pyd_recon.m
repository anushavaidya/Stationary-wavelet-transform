function C = pyd_recon(B)   
    global h1
    global h2
    global g1
    global g2
    [rows,columns,channels] = size(B);
    
    
    row_offset = 1;
    column_offset = 0;
    C = synthesis_filter_column(B,rows/32,columns/32,row_offset,column_offset,h2,g2);
    %imshow(C)
    
    row_offset = rows/32+1;
    column_offset = 0;
    C = synthesis_filter_column(C,rows/32,columns/32,row_offset,column_offset,h2,g2);
    %imshow(C);
    
    row_offset = 0;
    column_offset = 1;
    C = synthesis_filter_row(C,rows/32,columns/16,row_offset,column_offset,h2,g2);
    %imshow(C);
    % % 
    % % 
    % % %---------%
    % 
    row_offset = 1;
    column_offset = 0;
    C = synthesis_filter_column(C,rows/16,columns/16,row_offset,column_offset,h2,g2);
    imshow(C);
    % 
    row_offset = rows/16+1;
    column_offset = 0;
    C = synthesis_filter_column(C,rows/16,columns/16,row_offset,column_offset,h2,g2);
    %imshow(C);
    
    row_offset = 0;
    column_offset = 1;
    C = synthesis_filter_row(C,rows/16,columns/8,row_offset,column_offset,h2,g2);
    %imshow(C);
    
    %--------------------------%
    
    row_offset = 1;
    column_offset = 0;
    C = synthesis_filter_column(C,rows/8,columns/8,row_offset,column_offset,h2,g2);
    
    row_offset = rows/8+1;
    column_offset = 0;
    C = synthesis_filter_column(C,rows/8,columns/8,row_offset,column_offset,h2,g2);
    %imshow(C);
    
    row_offset = 0;
    column_offset = 1;
    C = synthesis_filter_row(C,rows/8,columns/4,row_offset,column_offset,h2,g2);
    %imshow(C);
    
    
    
    row_offset = 1;
    column_offset = 0;
    C = synthesis_filter_column(C,rows/4,columns/4,row_offset,column_offset,h2,g2);
    
    row_offset = rows/4+1;
    column_offset = 0;
    C = synthesis_filter_column(C,rows/4,columns/4,row_offset,column_offset,h2,g2);
    %imshow(C);
    
    row_offset = 0;
    column_offset = 1;
    C = synthesis_filter_row(C,rows/4,columns/2,row_offset,column_offset,h2,g2);
    %imshow(C);
    %---------------%
    row_offset = 1;
    column_offset = 0;
    C = synthesis_filter_column(C,rows/2,columns/2,row_offset,column_offset,h2,g2);
    
    row_offset = rows/2+1;
    column_offset = 0;
    C = synthesis_filter_column(C,rows/2,columns/2,row_offset,column_offset,h2,g2);
    %imshow(C);
    
    row_offset = 0;
    column_offset = 1;
    C = synthesis_filter_row(C,rows/2,columns,row_offset,column_offset,h2,g2);
end

    

