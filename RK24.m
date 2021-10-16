function [t,y] = RK24(f,y0,t0,tf,dt,tol)

    t    = t0:dt:tf;
    n    = length(t);
    m    = size(y0,1); % number of equations
    y    = zeros(m,n); % initialize y as a matrix
    i    = 1; 
    y(:,i) = y0; % set first column of y to the initial condition
    tcur = t0;
    dti  = dt;
    

    while( tcur < tf )
        
        i    = i+1;
    	dti  = min( dti,tf-tcur );
        
        k1   = f( tcur , y(:,i-1) );      Y1 = y(:,i-1) + .5*dti*k1;
        k2   = f( tcur + .5*dti , Y1 ); Y2 = y(:,i-1) + .5*dti*k2;
        k3   = f( tcur + .5*dti , Y2 ); Y3 = y(:,i-1) + dti*k3;
        k4   = f( tcur + dti , Y3 );
        
        tau  = norm( (k1+2*k2+2*k3+k4)/6 - k2 );
        tht  = sqrt( tol/tau );
        if( tau < tol )
            tcur = tcur + dti;
            t(i) = tcur;
            y(:,i) = y(:,i-1) + dti*k2;
            dti  = min( .99*tht*dti , dt );
        else
            i    = i-1;
            dti  = min( .99*tht*dti , dt );
        end
        
    end
    
    % Name: Taylor Rodriguez
    % SID: 011653692
    
    % 1c) The plots and movies are the same. If anything the movie is
    %     slightly slower at the curves.
    
    % 1d) Plot submitted (way slower at the curves in the movie)
    
    %  2) The plots are slightly different. Compared to 1c) the difference
    %    is more obvious.
    
    
    
    