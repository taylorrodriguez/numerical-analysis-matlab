 function [x1,w1,x2,w2,x3,w3,x4,w4] = gauss
 load('points.mat');
w1 = zeros(1,4); % for gaussian quadrature with n=3
w2 = zeros(1,7); % for gaussian quadrature with n=6
w3 = zeros(1,13); % for gaussian quadrature with n=12
w4 = zeros(1,25); % for gaussian quadrature with n=24
% code for parts (c) - (e) goes here

y1 = [-1 0 1]; w = [1 4 1]/3; % points and weights for Simpson's rule

% now integrate L {3,k} exactly with Simpson's rule
for k=0:3,
    L = lagrange(y1,x1,k);
    val = sum(L.*w);
    w1(k+1) = val;
end;

% now integrate L {6,k} using Gaussian quadrature with n=3
for k=0:6,
    L = lagrange(x1,x2,k);
    val = sum(L.*w1);
    w2(k+1) = val;
end;

for k=0:12,
    L = lagrange(x2,x3,k);
    val = sum(L.*w2);
    w3(k+1) = val;
end

for k=0:24,
    L= lagrange(x3,x4,k);
    val = sum(L.*w3);
    w4(k+1) = val;
end;
% f= @(x)exp(-x.*x/2);
disp(sum(w2.*f(x2)));
disp(sum(w4.*f(x4)));

%Name: Taylor Rodriguez
%SID: 011653692

% 1e) w1(1 : 3) = 0.3479, 0.6521, 0.6521
%     w2(1 : 3) = 0.1295, 0.2797, 0.3818
%     w3(1 : 3) = 0.0405, 0.0921, 0.1389
%     w4(1 : 3) = 0.0114, 0.0264, 0.0409

% 1f) Gaussian quadrature:     n=6,  Approximation is 1.711248784012375
%                                    Error is 2.280775568408444e-10
%                              n=24, Approximation is 1.711248783784298
%                                    Error is 6.661338147750939e-16
%     Composite Simpson Rule:  n=6,  Approximation is 1.71142204648742
%                                    Error is 1.732627031225675e-04
%                              n=24, Approximation is 1.71124943540318
%                                    Error is 6.516188826299896e-07

% How do they compare? The Gaussian quadrature approximations are much more 
% accurate and have much smaller error values with the same number of 
% points.

% 1g) Gaussian quadrature:     n=6,  Approximation is 1.220512215842145
%                                    Error is 0.112821117491188
%                              n=24, Approximation is 1.315352791719249
%                                    Error is 0.017980541614084
%     Composite Simpson Rule:  n=6,  Approximation is 1.20459708046448
%                                    Error is 0.128736252868853
%                              n=24, Approximation is 1.32942753595577
%                                    Error is 0.003905797377563

% How do they compare? The Gaussian quadrature errors are much closer
% to the CSR errors unlike in the last problem. The errors themselves
% however are much larger here than in the last problem.
    
    
    
    