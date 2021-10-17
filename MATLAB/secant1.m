function [p1,n] = secant(f,p0,p1)

    nmax = 100;       % maximum number of iterations
    tol  = 10^(-15);  % desired accuracy
    err  = Inf;
    n    = 1;
    
    while( err > tol && n<=nmax )
        
        p  = p1 - f(p1)*(p1-p0)/(f(p1)-f(p0));
        err = abs( p - p1 );
        
        if( err < tol)
            disp(p);
        end
        
        n = n+1;
        
       p0 = p1;
       f(p0) = f(p1);
       p1 = p;
       f(p1) = f(p);

    end
        
    if( n >= nmax )
        error('Secant method did not converge');
    end
    
 % Name: Taylor Rodriguez
 % SID: 011653692
 %
 % 1c) 835 iterations
    
    