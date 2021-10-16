function S = spline(x,f,fpl,fpr,y)
% x : (n+1) evaluation points
% f : (n+1) function values
% fpl : boundary condition at x_0
% fpr : boundary condition at x_n
% y : evaluation points
% S : value of spline at the evaluation points in y

n = length(x)-1; % number of points
h = x(2) - x(1); % spacing between points

for i>=0 & i <= (n-1);
    h(i)= x(i+1)-x(i)

for i>=1 & i<= (n-1);
    q(i)= (3/(h(i))*(a(i+1)-a(i))) - 3/(h(i-1))*(a(i)-a(i-1));
    
l(0)=1;
u(0)=0;
z(0)=0;

for i>= 1 & i<= (n-1);
    l(i)= 2(x(i+1) - x(i-1)) - h(i-1)*u(i-1);
    u(i)= h(i)/l(i);
    z(i)= (q(i)-h(i-1)*z(i-1))/z(i);
    
l(n)=0;
z(n)=0;
c(n)=0;

for j>=(n-1) & j<=0;
    c(j)=z(j)-u(j)*c(j+1);
    b(j)= (a(j+1)-a(j))/h(i) - (h(i)/3)*(c(j+1)+2*c(j));
    d(j) = (c(j+1) -c(j))/3*h(j);
    
    
    

a = f';
da = ( a(2:end) - a(1:end-1) )/h; % contains (a {j+1} - a {j})/h
r = [ 3*(da(1)-fpl)/h;3*(da(2:end)-da(1:end-1))/h;3*(fpr-da(end))/h];

A(1,1) = 2;
A(n+1,n+1) = 2;
c = A\r;
d = (c(2:end) - c(1:end-1))/(3*h);
b = da - h*c(1:end-1) - h*h*d;


function S = evaluate(x,y,a,b,c,d)
n = length(x) - 1;
h = x(2) - x(1);
% implement below



S = 0*y;
for k=1:length(y)
    j = min( floor( (y(k) - x(1))/h ) + 1,n); % interval [x(j),x(j+1)] contains y
    
    
end

j = min( floor( (y(k) - x(1))/h ) + 1,n);

%Name: Taylor Rodriguez
%SID: 011653692





