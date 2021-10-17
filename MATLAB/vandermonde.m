function V = vandermonde(x)
    % x is an 1 -by- (n+1) row vector
    n = size(x,2) - 1;
    V = zeros(n+1,n+1);
    for i=1:n+1
        for j=1:n+1
            V(i,j) = x(i)^(n-j);
        end
    end

end


%Name: Taylor Rodriguez
%SID: 011653692
%
% d)