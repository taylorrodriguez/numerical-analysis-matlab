function [t,y] = RK24(f,y0,t0,tf,dt,tol)

    t    = t0:dt:tf;
    y    = 0*t;
    i    = 1;
    tcur = t0;
    y(i) = y0;
    dti  = dt;
    
    while( tcur < tf )
        
        i    = i+1;
    	dti  = min( dti,tf-tcur );
        
        k1   = f( tcur , y(i-1) );      Y1 = y(i-1) + .5*dti*k1;
        k2   = f( tcur + .5*dti , Y1 ); Y2 = y(i-1) + .5*dti*k2;
        k3   = f( tcur + .5*dti , Y2 ); Y3 = y(i-1) + dti*k3;
        k4   = f( tcur + dti , Y3 );
        
        tau = abs( (k1+2*k2+2*k3+k4)/6 - k2 );
        theta = sqrt( tol/tau );
        
        if( tau < tol ), % accept, error is small enough
            y(i) = y(i-1) + dti*k2;
            tcur = tcur + dti;
            t(i) = tcur;
            dti = min( .99*theta*dti , dt );
        else % try again, error is too big
            i = i-1;
            dti = min( .99*theta*dti , dt );
        end;
        % uncomment for movie
        tex = linspace(t0,tf,200); yex = exp(-20*tex) + sin(tex);
        figure(1);plot(tex,yex);hold on;plot(t(1:i),y(1:i),'rd');hold off;pause(.05);
    end; % end of code

        
        tcur = tcur + dti;
        t(i) = tcur;
        y(i) = y(i-1) + dti*(k1+2*k2+2*k3+k4)/6;
        
end
    
% Name: Taylor Rodriguez
% SID: 011653692

% 1d)     Global Error = 0.053899772886629
%     Minimal Timestep = 0.006158552228873
%     Maximal Timestep = 0.137836026891425
%  Total# of timesteps = 50

% 1e)     Global Error = 0.044023576940679
%     Minimal Timestep = 0.001926415666332
%     Maximal Timestep = 0.117435392170108
%  Total# of timesteps = 110

% 1f)  Global Error(d) = 0.001021554583229
%      Global Error(e) = 5.653160345151786e-04


