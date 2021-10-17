function [p1,n] = newton(f,fprime,p0)

    nmax = 100;     % maximum number of iterations
    tol = 10^(-10); % desired accuracy
    n = 0;
    
    
    
    while ( n<=nmax),
        
        p1 = p0 - f(p0)/fprime(p0);
        err = abs(p1-p0);

        if( err < tol ),
            disp(p1);
        end;
        
        n = n+1;
        p0 = p1;

        if( 1/abs(fprime(p1)) == Inf ),
            error('Encountered division by zero');
        end;
        
        if( abs(fprime(p1)) < eps ),
            warning('Encountered possible division by zero');
        end;
    end;
    
    if( n >= nmax ),
        error('Newton method did not converge');
    end;
    
    % Name: Taylor Rodriguez
    % SID: 011653692
    % 2c)1.414213562 , 5 iterations
    % 2d)1.414213563 , 30 iterations is more than 5. This is due to the 
    %    initial function
    % 2e)converges for p0 = -1
    
   