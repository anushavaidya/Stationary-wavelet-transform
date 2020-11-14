function X = synthesis_filter_row(X,rows,columns,row_offset,column_offset,h,g)
    global x1
    global x2
    global z1
    global z2
    global delay;
    global filter_taps;
    global temp;
    N = rows*2;
    for column = column_offset:columns+column_offset-1
        for n = 1:delay/2
            x1(n)=X(int16(delay/2)+1-n+row_offset,column);
        end
        for n = 1:rows
            x1(n+int16(delay/2)-1) = X(n+row_offset,column);
        end
        for n = rows+1: rows+ delay/2
            x1(n+int16(delay/2)-1) = X(2*rows-n+1+row_offset,column);
        end
 
        for n = 1:rows+delay-1
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
           x2(n) = X(int16(delay/2)-n +1+row_offset+rows,column);
       end
       for n=1:rows
           x2(n+int16(delay/2)) = X(n+row_offset+rows,column);
       end
       for n=rows:rows+int16(delay/2)-1
           x2(n+int16(delay/2)) = X(2*rows-n-1+row_offset+rows,column);
       end

        
        for n = 1:rows+delay
            temp(2*n)= x2(n+1);
            temp(2*n-1)= 0;
        end
        
             
        for m=1:2:N-1
            sum = 0;
            for n = m+1 - (filter_taps+1) :2: (m+1 - (filter_taps+1))+8
%                 
                sum = sum + (temp( n+filter_taps+1 ) * g(m-n));
%                 
            end
            z2(m) = sum;

            sum = 0;
            for n=(m+1)-filter_taps:2:(m+1)-filter_taps+6
                sum = sum+temp(n+filter_taps+1)*g((m+1)-n-1);
            end
            z2(m+1)=sum;            
        end
        
        for row = 1:N
            X(row+row_offset,column)  = z1(row) + z2(row);
        end
    end
end


        
        
