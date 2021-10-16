function [x,f] = laplace(a,b,n,g)

x = linspace(a,b,n+1); h = x(2) - x(1);


 g(2:end-1)= -((f(3:end)+f(1:end-2)-2*f(2:end-1)))/(h*h);


% set up the linear system
A = gallery('tridiag',-ones(n,1),2*ones(n+1,1),-ones(n,1));
A(1,1) = 1; A(1,2) = 0;
A(n+1,n+1) = 1; A(n+1,n) = 0;

% form the right hand side
rhs = h*h*g(x)';
rhs(1) = -0.2; % boundary condition at left point x=a
rhs(end) = 0.1; % boundary condition at right point x=b

% solve linear system
f = A\rhs;

%Name: Taylor Rodriguez
%SID: 011653692

% 2b) h1 = 0.312
%     h2 = 0.313
%      p = 1.9969

% 2c) h1 = 0.106
%     h2 = 0.107
%      p = 1.9860