function [p,n] = fixedpoint(g,p0)

    nmax = 100;     % maximum number of iterations
    tol = 10^(-6); % desired accuracy
    n = 0;
    err = Inf;
    
    while( err > tol && n <= nmax ),
        
        p = g(p0);   

        err = abs(p-p0);

        if( err < tol)
            disp(p);
            break;
        end;
        n = n+1;
        p0 = p;
        
    end;

    if( n >= nmax ),
        error('Fixed-point iteration did not converge');
    end;
    
    %Name: Taylor Rodriguez
    %SID: 011653692
    %
    % 1b)For c = 3    16 iterations
    %    For c = 2.5  12 iterations
    %    For c = 2     4 iterations
    % 1c)The method did not converge. The function does not satisfy
    %    contraction/mapping. When you plug in p0 into the
    %    absolute value of the derivative of g(x), you get a number > 1.
    
    