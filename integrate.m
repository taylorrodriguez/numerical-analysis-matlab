function [trap,simp] = integrate(x,f)
n = size(x,2) - 1;
h = x(2) - x(1);
dx = h*ones(1,n+1); dx(1) = .5*dx(1); dx(end) = .5*dx(end); % for CTR
dy = h*ones(1,n+1); dy(1) = (1/3)*dy(1); dy(end) = (1/3)*dy(end); %for CSR
trap = sum(f.*dx); % composite trapezoid rule

for (1i < n)
    if( mod(1i,2) == 0 ),
        dy(1i) = (4/3)*dy(1i);
    end;

    if( mod(1i,2) == 1 ),
        dy(1i) = (2/3)*dy(1i);
    end;
    1i+1;
end


if( mod(n,2) == 0 ), % n is even,
    simp = sum(f.*dy);
end;

if( mod(n,2) == 1 ), % n is odd
    simp = NaN; % composite simpsons rule undefined 
end;

%Name: Taylor Rodriguez
%SID: 011653692

% 1b) CSR: es1 = -2.19e-5
%          es2 = -1.35e-6 
%            p = 4.0199
%     CTR: et1 = 0.0040
%          et2 = 0.0010
%            p = 2.0175
% The CTR order of accuracy is less than the CSR order of accuracy
% 1c) CSR: es1 = 0.37845
%          es2 = 0.37811
%            p = 0.00128
%     CTR: et1 = 0.37917
%          et2 = 0.37836
%            p = 0.00309

% The order of accuracies are very small. This can be because all the
% negative values will become positive and therefore f(-1)=f(1) and the
% same thing will happen with the other negatives.




