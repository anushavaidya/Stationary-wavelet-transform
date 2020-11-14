function X = analysis_filter_column(X,rows,columns,row_offset,column_offset,h,g)
    global x1
    global x2
    global z1
    global z2
    global delay;
    global filter_taps;
    N = columns;
    
    
    for row = row_offset:rows+row_offset-1
        
        for n=1:delay-1
            x1(n) = X(row,delay-n+column_offset);
        end
%         
        for n=1:N
            x1(n+delay-1) = X(row,n+column_offset);
        end
        
        
        for n=N+1: N + delay-1
            x1(n+delay-1)= X(row,2*N-n-2+column_offset+1);
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
                
        for column=0:(columns/2)-1
            X(row,column+column_offset+1) = z1(column*2+1);
        end
        
        for column=1:(columns/2)
            X(row,column+column_offset+columns/2) = z2(column*2);
            
        end
    end
end
            
            