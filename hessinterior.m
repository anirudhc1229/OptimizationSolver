function h = hessinterior(w, lambda, n, V)
    hessf = zeros(n);
    hessc = zeros([n, n, n*(n-1)/2]);
    idx = 1;
    for i = 1:n
        for j = (i+1):n
            hessc(i, i, idx) = -2*V(i, 1)^2 - 2*V(i, 2)^2 - 2*V(i, 3)^2;
            hessc(i, j, idx) = 2*V(i, 1)*V(j, 1) + 2*V(i, 2)*V(j, 2) + 2*V(i, 3)*V(j, 3);
            hessc(j, i, idx) = 2*V(i, 1)*V(j, 1) + 2*V(i, 2)*V(j, 2) + 2*V(i, 3)*V(j, 3);
            hessc(j, j, idx) = -2*V(j, 1)^2 - 2*V(j, 2)^2 - 2*V(j, 3)^2;
            idx = idx + 1;
        end
    end
    h = hessf;
    for i = 1:n*(n-1)/2
        h = h + lambda.ineqnonlin(i) * hessc(:, :, i);
    end
end