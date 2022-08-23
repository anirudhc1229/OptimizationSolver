function [X, w, fval] = optimize2(S, V, r, n)
    sphere_plt(S, r, n);
    tic
    fun = @(w)sum(w);
    w0 = zeros([1, n]);
    lb = zeros([1, n]);
    ub = ones([1, n]);
    nonlcon = @(w)nonlincon(w, S, V, r, n);
    options = optimoptions("fmincon",...
        "Algorithm","interior-point",...
        "EnableFeasibilityMode",true,...
        "SubproblemAlgorithm","cg");
    [w, fval] = fmincon(fun, w0, [], [], [], [], lb, ub, nonlcon, options);
    X = zeros([n, 3]);
    for i = 1:n
        X(i, :) = S(i, :) + w(i) * V(i, :);
    end
    timeElapsed = toc
    sphere_plt(X, r, n);
end