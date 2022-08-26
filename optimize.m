function [X, w, fval] = optimize(S, V, r, n)
    sphere_plt(S, r, n);
    tic
    fun = @(w)obj(w, n);
    w0 = zeros([1, n]);
    lb = zeros([1, n]);
    ub = ones([1, n]);
    nonlcon = @(w)nonlincon(w, S, V, r, n);
    hess = @(w, lambda)hessinterior(w, lambda, n, V);
    options = optimoptions("fmincon",...
        "Algorithm","interior-point",...
        "EnableFeasibilityMode",true,...
        "SubproblemAlgorithm","cg",...
        "SpecifyObjectiveGradient",true,...
        "SpecifyConstraintGradient",true,...
        'HessianFcn', hess);
    [w,fval,eflag,output] = fmincon(fun, w0, [], [], [], [], lb, ub, nonlcon, options);
    X = zeros([n, 3]);
    for i = 1:n
        X(i, :) = S(i, :) + w(i) * V(i, :);
    end
    timeElapsed = toc
    disp([output.funcCount,output.iterations])
    sphere_plt(X, r, n);
end