function I_RE = richardson(n1,n2)
f = @(x) exp(-x.*x/2);
x1 = linspace(-1,1,n1+1);
x2 = linspace(-1,1,n2+1);

[t1] = integrate(x1,f(x1));
[t2] = integrate(x2,f(x2));

I_RE = (4*t2 - t1)/3; % for composite trapezoid rule (CTR)
%I_RE = (16*t2 - t1)/15 for CSR p=4
%I_RE = (2^(1.5)*t2 - t1)/(2^(1.5)-1)for CTR and CSR p = 1.5


%Name: Taylor Rodriguez
%SID: 011653692

% 2b)CTR: I_RE = 1.7113, t1=1.7072, t2=1.7102, et1=0.0040, et2=0.0010
%    CSR: I_RE = 1.7112, t1=1.711271,t2=1.711250, et1=-2.19e-5, et2=-1.35e-6 
 
% 2c)CTR: I_RE = 1.33316, t2= 1.33289, t1=1.33207, et1=0.37917, et2=0.37836
%    CSR(p=4):I_RE = 1.33315. t2=1.33313,t1=1.33279, et1=0.37845 ,et2=0.37811

% 2d)CTR(p=1.5):I_RE = 1.3333317, et1=0.37917, et2=0.37836
%    CSR(p=1.5):I_RE = 1.33332, et1=0.37845 ,et2=0.37811

% The errors are similar and should be less than those without 
% using richardsons. 
