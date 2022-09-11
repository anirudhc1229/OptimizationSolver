function [c, ceq, gradc, gradceq] = nonlincon(w, S, V, P, r, n)

    c = zeros([1, height(P)]);
%     c = zeros([1, n * (n - 1) / 2]);
%     idx = 1;
    for idx = 1:height(P)
        i = P(idx, 1);
        j = P(idx, 2);
        lamb = [(r(i) + r(j))^2];
        x = (S(i, :) + w(i) * V(i, :)) - (S(j, :) + w(j) * V(j, :));
        c(idx) = lamb - x * x.';
    end
%     for i = 1:n
%         for j = (i+1):n
%             lamb = [(r(i) + r(j))^2];
%             x = (S(i, :) + w(i) * V(i, :)) - (S(j, :) + w(j) * V(j, :));
%             c(idx) = lamb - x * x.';
%             idx = idx + 1;
%         end
%     end
    ceq = [];

    if nargout > 2
%        gradc = zeros([n, n * (n - 1) / 2]);
        gradc = zeros([n, height(P)]);
%        idx = 1;
        for idx = 1:height(P)
            i = P(idx, 1);
            j = P(idx, 2);
            gradc(i, idx) = ...
               -2*V(i, 1)*(S(i, 1) - S(j, 1) + V(i, 1)*w(i) - V(j, 1)*w(j)) ...
               - 2*V(i, 2)*(S(i, 2) - S(j, 2) + V(i, 2)*w(i) - V(j, 2)*w(j)) ...
               - 2*V(i, 3)*(S(i, 3) - S(j, 3) + V(i, 3)*w(j) - V(j, 3)*w(j));
           gradc(j, idx) = ...
               2*V(j, 1)*(S(i, 1) - S(j, 1) + V(i, 1)*w(i) - V(j, 1)*w(j)) ...
               + 2*V(j, 2)*(S(i, 2) - S(j, 2) + V(i, 2)*w(i) - V(j, 2)*w(j)) ...
               + 2*V(j, 3)*(S(i, 3) - S(j, 3) + V(i, 3)*w(j) - V(j, 3)*w(j));
        end
%        for i = 1:n
%            for j = (i+1):n
%                gradc(i, idx) = ...
%                    -2*V(i, 1)*(S(i, 1) - S(j, 1) + V(i, 1)*w(i) - V(j, 1)*w(j)) ...
%                    - 2*V(i, 2)*(S(i, 2) - S(j, 2) + V(i, 2)*w(i) - V(j, 2)*w(j)) ...
%                    - 2*V(i, 3)*(S(i, 3) - S(j, 3) + V(i, 3)*w(j) - V(j, 3)*w(j));
%                gradc(j, idx) = ...
%                    2*V(j, 1)*(S(i, 1) - S(j, 1) + V(i, 1)*w(i) - V(j, 1)*w(j)) ...
%                    + 2*V(j, 2)*(S(i, 2) - S(j, 2) + V(i, 2)*w(i) - V(j, 2)*w(j)) ...
%                    + 2*V(j, 3)*(S(i, 3) - S(j, 3) + V(i, 3)*w(j) - V(j, 3)*w(j));
%                idx = idx + 1;
%            end
%        end
       gradceq = [];
    end

end