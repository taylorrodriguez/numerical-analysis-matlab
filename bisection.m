function [p1,n] = bisection(f,a,b)

    nmax = 100;     % maximum number of iterations
    tol = 10^(-10); % desired accuracy
    a1 = a; b1 = b; p1 = a1 + .5*(b1-a1); % initial guess for solution
    
    if( f(b)*f(a) > 0 ),
        error('Endpoints have same sign');
    end;
    
    for n = 2:nmax,
        
        p0 = p1;

        if( f(a1)*f(p1) < 0 ), % take the left interval
            b1 = p1;
        end;
        
        if( f(b1)*f(p1) < 0 ), % take the right interval
            a1 = p1;
        end;

        p1 = a1 + .5*(b1-a1); % update guess for solution

        err = abs(p0-p1);

        if( err < tol || f(p1) == 0 )
            break;
        end;
        
    end;

    if( n >= nmax ),
        error('Bisection method did not converge');
    end;
    