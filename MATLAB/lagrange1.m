


x = linspace(0,1,3);
f = (cos(2*pi*x)+1)/2;
y = linspace(0,1,200);

P = 0*y;
for k=1:length(x)
    P = P + f(k)*lagrange(y,x,k-1);
end



function L = lagrange(y,x,k)

    n = length(x) - 1; m = length(y);
    if( k < 0 || k > n )
        error('Input k must be an integer in [0,length(x)-1]');
    end

    den = x(k+1) - x; den(k+1) = 1; den = den'; den = den*ones(1,length(y));
    num = ones(n+1,1)*y - x'*ones(1,m);
    num(k+1,:) = ones(1,m);
    
    L = prod( num./den , 1);
    
end