function [p1,n] = secant(f,p0,p1)

    nmax = 100;       % maximum number of iterations
    tol  = 10^(-15);  % desired accuracy
    err  = Inf;
    n    = 0;
    
    while( err > tol && n<=nmax )
        
        fp  = ( f(p1) - f(p0) )/(p1 - p0);
        p0  = p1;
        
        if( 1/abs(fp) == Inf )
            error('encountered division by zero');
        end
        
        if( abs( fp ) < eps )
            warning('encountered possible division by zero');
        end
        
        p1  = p1 - f(p1)/fp;
        
        err = abs( p0 - p1 ); 
        n   = n+1;

    end
        
    if( n >= nmax )
        error('secant method did not converge');
    end
    