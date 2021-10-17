 function[I2,I4] = twodimensions(x2,w2,x4,w4)
f = @(x,y) exp(-x.*x-y.*y);

W = (w2')*w2;
n = size(x2,2) - 1;
X = (x2')*ones(1,n+1); Y = ones(n+1,1)*x2;% matrices containing evaluation points
F = f(X,Y);                               % matrix of function values
I2 = sum( sum( F.*W ) );
disp(I2);

V = (w4')*w4;
m= size(x4,2) - 1;
S = (x4')*ones(1,m+1); T = ones(m+1,1)*x4;
G = f(S,T);
I4 = sum( sum( G.*V ) );
disp(I4);

% Name: Taylor Rodriguez
% SID: 011653692

% 2b) I2 = 2.230985210842528
% 2c) I4 = 2.230985141404136

