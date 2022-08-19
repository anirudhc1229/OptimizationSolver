function [X, fval] = optimize(S, V, r, n)
    fun = @(X)objective(X, S, n);
%     fun = @(X)0;
    nonlcon = @(X)constraints(X, S, V, r, n);
    X0 = S;
    options = optimoptions("fmincon",...
        "Algorithm","interior-point",...
        "EnableFeasibilityMode",true,...
        "SubproblemAlgorithm","cg");
    [X, fval] = fmincon(fun, X0, [], [], [], [], [], [], nonlcon, options);
end