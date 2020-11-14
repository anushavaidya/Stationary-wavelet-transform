function X = synthesis_filter_column(X,rows,columns,row_offset,column_offset,h,g)
    global x1
    global x2
    global z1
    global z2
    global delay;
    global filter_taps;
    global temp;
    N = columns*2;
    for row = row_offset:rows+row_offset-1
        for n = 1:delay/2
            x1(n)=X(row,int16(delay/2)+1-n+column_offset);
        end
        for n = 1:columns
            x1(n+int16(delay/2)-1) = X(row,n+column_offset);
        end
        for n = columns+1: columns+ delay/2
            x1(n+int16(delay/2)-1) = X(row,2*columns-n+1+column_offset);
        end
 
        for n = 1:columns+delay-1
            temp(2*n)= 0.0;
            temp(2*n-1)= x1(n+1);
        end
               
        for m=1:2:N-1
            sum = 0;
            for n = m - (filter_taps+1) :2: (m - (filter_taps+1))+6

                sum = sum + (temp( n+filter_taps+1 ) * h(m-n-1));

            end
            z1(m) = sum;

            sum = 0;
            for n=(m+1)-filter_taps:2:(m+1)-filter_taps+6
                sum = sum+temp(n+filter_taps+1)*h((m+1)-n-1);
            end
            z1(m+1)=sum;            
        end
        
        

       for n=1:int16(delay/2)-1
           x2(n) = X(row,int16(delay/2)-n +1+column_offset+columns);
       end
       for n=1:rows
           x2(n+int16(delay/2)) = X(row, n+column_offset+columns);
       end
       for n=rows:rows+int16(delay/2)-1
           x2(n+int16(delay/2)) = X(row, 2*columns-n-1+column_offset+rows);
       end


        for n = 1:columns+delay
            temp(2*n)= x2(n+1);
            temp(2*n-1)= 0;
        end
        
        
        
        for m=1:2:N-1
            sum = 0;
            for n = m - (filter_taps) :2: (m - (filter_taps))+6

                sum = sum + (temp( n+filter_taps+1 ) * g(m-n-1));

            end
            z2(m) = sum;

            sum = 0;
            for n = m - (filter_taps) :2: (m - (filter_taps))+8
                sum = sum+temp(n+filter_taps+1)*g((m+1)-n-1);
            end
            z2(m+1)=sum;            
        end
        
        for column = 1:N
            X(row,column+column_offset)  = z1(column) + z2 (column) ;
        end
    end
end


        
        
