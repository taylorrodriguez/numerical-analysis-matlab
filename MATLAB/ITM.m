function [t,y] = ITM(f,y0,t0,tf,dt)
 
dt = (tf-t0)/10;
t = t0;
y = y0;

                  
for i = 1:10                              
    
    k1 = f(t(i-1),y(i-1)); 
    Y1 = y(i-1) + dt*k1; % initial guess for secant method
    x = secant(g,Y1,y(i-1)); % solve non-linear equation g(x) = 0 using secant method
    y(i) = x; % update solution

    
end

%Name: Taylor Rodriguez
%SID: 011653692