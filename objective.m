function val = objective(X, S, n)
    val = 0;
    for i = 1:n
        val = val + norm(X(i, :) - S(i, :));
    end
end