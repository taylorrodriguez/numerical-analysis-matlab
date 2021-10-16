function [t,y] = RK4(f,y0,t0,tf,dt)
                                           
dt = (tf-t0)/10;
t = t0;
y = y0;

                  
for i = 1:10                              
    K1 = f(t(i),y(i));
    K2 = f(t(i)+0.5*dt,y(i)+0.5*dt*K1);
    K3 = f((t(i)+0.5*dt),(y(i)+0.5*dt*K2));
    K4 = f((t(i)+dt),(y(i)+K3*dt));
    y = y(i) + (1/6)*(K1+2*K2+2*K3+K4)*dt;
    t = t0 + i*dt;
    
end

%Name: Taylor Rodriguez
%SID: 011653692
