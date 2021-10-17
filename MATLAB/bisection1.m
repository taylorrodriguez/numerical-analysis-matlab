function [p1,n] = bisection(f,a,b)

    nmax = 100;      % maximum number of iterations
    tol = 10^(-8);    % desired accuracy
    p1 = (b + a)/2;    % initial guess for solution
    
    if( f(a)*f(b) > 0)
        error('Endpoints have the same sign');
    end
       
    for n = 2:nmax

        if( f(p1)*f(a) > 0 )  % take right interval
            a = p1;
        end
        
        if( f(p1)*f(a) < 0 )  % take left interval
            b = p1;
        end
      
        p0 = p1;
        p1 = (b + a)/2;          % update midpoint
        err = abs(p0 - p1);
        
        if(f(p1) == 0 || err < tol)
            break;
        end
    end
    
    if(n>=nmax)
        warning('Bisection did not converge to tolerance');
    end
    
    
    % Name: Taylor Rodriguez
    % SID: 011653692
    
    % 1d. 1.4142
    %     22 iterations
    
    % 1e. actual error: 5.7184e-07
    %     estimated error from class: 9.536743e-07
    %     estimated > actual
    
    % 2a. function: f(x)= x^3 - 19
    %     interval: [1,3]
    %     approximation: 2.6684
    %     number of iterations: 28
    
    % 2b. estimated number of iterations: 27.57542
    %     actual number of iterations: 28
    %     actual > estimated    
    
        
        
    