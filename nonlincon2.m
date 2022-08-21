function [c, ceq] = nonlincon(w, S, V, r, n)
    c = zeros([1, n * (n - 1) / 2]);
    ceq = [];
    idx = 1;
    for i = 1:n
        for j = (i+1):n
            c(idx) = r(i) + r(j) - norm((S(i, :) + w(i) * V(i, :)) - (S(j, :) + w(j) * V(j, :)));
            idx = idx + 1;
        end
    end
end