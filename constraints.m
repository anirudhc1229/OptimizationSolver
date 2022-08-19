function [c, ceq] = constraints(X, S, V, r, n)
    c = zeros([1, n * (n - 1) / 2 + n]);
    ceq = zeros([1, n]);
    % constraint 1
    idx = 1;
    for i = 1:n
        for j = (i+1):n
            c(idx) = r(i) + r(j) - norm(X(i) - X(j));
            idx = idx + 1;
        end
    end
    % constraint 2
    for i = 1:n 
        c(idx+i) = norm(X(i) - S(i)) - norm(V(i));
    end
    % constraint 3
    for i = 1:n
        ceq(i) = dot(X(i) - S(i), V(i)) - 1;
    end

%     % constraint relaxation
%     delta = 1000;
%     for i = 1:length(c)
%         c(i) = c(i) - delta;
%     end
%     for i = 1:length(ceq)
%         ceq(i) = ceq(i) - delta;
%     end

end