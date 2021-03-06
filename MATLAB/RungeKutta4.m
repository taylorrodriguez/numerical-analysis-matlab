h=0.05;                                             % step size
x = 1:h:3;                                         % Calculates upto y(3)
y = zeros(1,length(x)); 
y(1) = 1;                                          % initial condition
F_xy = @(t,y) (-100*t*y.^2) + (100/t) - (1/t.^2);                   
for i=1:(length(x)-1)                              % calculation loop
    k_1 = F_xy(x(i),y(i));
    k_2 = F_xy(x(i)+0.5*h,y(i)+0.5*h*k_1);
    k_3 = F_xy((x(i)+0.5*h),(y(i)+0.5*h*k_2));
    k_4 = F_xy((x(i)+h),(y(i)+k_3*h));
    y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h;  % main equation
end