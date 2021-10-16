function [t,y]= BE(f,y0,t0,tf,N)

dt = (tf - t0)/N;
t = [t0 zeros(1,N)];
y = [y0 zeros(1,N)];

    for i = 1:N
        t(i + 1) = t(i) + dt;
        ynew = y(i) + dt*(f(t(i),y(i)));
        y(i + 1) = y(i) + dt*f(t(i + 1),ynew);
    end
end

% Name: Taylor Rodriguez
% SID: 011653692
% 1b) No value of dt agreed with the exact solution. Testing dt = .09
% however gave me a plot where dt agreed closely with the exact solution.