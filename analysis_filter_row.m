function X = analysis_filter_row(X,rows,columns,row_offset,column_offset,h,g)
    global x1
    global x2
    global z1
    global z2
    global delay;
    global filter_taps;
    N = rows;
    
    
    for column = column_offset:columns+column_offset-1
        for n=1:delay-1
            x1(n) = X(delay-n+row_offset, column);
        end
        for n=1:N
            x1(n+delay-1) = X(n+row_offset,column);
        end
        
        for n=N+1: N + delay-1
            x1(n+delay-1)= X(2*N-n-2+row_offset+1,column);            
        end
        
        for n=1:N+2*(delay-1)
            x2(n) = x1(n);
        end
        
        for m=1:2:N-1
            sum = 0;
            
            for n = m - (filter_taps+1) : (m - (filter_taps+1))+8
                sum = sum + (x1( n+filter_taps+1 ) * h(m-n-1));
            end
            z1(m) = sum;

        end
        
        for m=2:2:N-1
            sum = 0;
            
            for n= m-(filter_taps+1) : (m - (filter_taps+1))+8
                sum=sum+(x2(n+filter_taps+1)*g(m-n-1));
            end
            z2(m) = sum;
        end
                
        for row=0:(rows/2)-1
            X(row+row_offset+1,column) = z1(row*2+1);
        end
        
        for row=1:(rows/2)
            X(row+row_offset+rows/2, column) = z2(row*2);
            
        end
    end
end
            
            
