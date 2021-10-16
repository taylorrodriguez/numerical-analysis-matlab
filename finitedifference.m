 function [fd,bd,cd,tfd,tbd] = finitedifference(x,f)
 h = x(2) - x(1);

 % forward difference
 fd = f;
 fd(1:end-1) = ( f(2:end) - f(1:end-1) )/h; 
 fd(end) = NaN;

 % backward difference
 bd = f;
 bd(2:end) = ( f(2:end) - f(1:end-1))/h;

 % central difference
 cd = f;
 cd(2:end-1) = ( f(3:end) - f(1:end-2))/(2*h);

 % three point forward difference
 tfd = f;
 tfd(1:end-2) = ((4*f(2:end-1)) - (f(3:end)) - (3*f(1:end-2)))/(2*h);

 % three point backward difference
 tbd = f;
 tbd(3:end) = ((-4*f(2:end-1)) + (f(1:end-2)) + (3*f(3:end)))/(2*h);

 
 fd(end) = NaN; % forward difference undefined at last point
 bd(1) = NaN; % backward difference undefined at first point
 cd(1) = NaN;
 cd(end) = NaN;
 tfd(end-1) = NaN;
 tfd(end) =NaN;
 tbd(1:2) = NaN;
 
 disp(fd);
 disp(bd);
 disp(cd);
 disp(tfd);
 disp(tbd);
 
 %Name: Taylor Rodriguez
 %SID: 011653692
 
 % 1d) when n1=101 and n2=201, order of accuracy = p = 1
 %     when n1=201 and n2=401, order of accuracy = p = 1
 % 1e) when  using the average error, order of accuracy = p = 1.9969 > 1
 %     This can be because the e1 is larger than e2 even more when using avg
 %     error vs maximum error. Therefore the log will give us a larger
 %     value in the denominator and therefore a larger p.
 
 