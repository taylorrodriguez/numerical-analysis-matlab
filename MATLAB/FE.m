 function [t,y] = FE(f,y0,t0,tf,N)
 
dt = (tf - t0)/N;
t  = [t0 zeros(1,N)];
y  = [y0 zeros(1,N)];
    
    for i = 1:N
        t(i + 1) = t(i) + dt;
        y(i + 1) = y(i) + dt*f(t(i),y(i));
    end
end

 
 %Name: Taylor Rodriguez
 %SID: 011653692
 
 % 1b) EG1 = 0.019835719974971
 %     EG2 = 0.009531617529936
 %     order of accuracy p = 1.057307796220342
 % 1c) dt = .15 agrees the most. As dt increases, the approximatons agree
 %     less and less with the exact solution.
 
 
 
 
 