function h = hessinterior(w, lambda, n, V, P)
    hessf = zeros(n);
    h = hessf;
    for idx = 1:height(P)
        i = P(idx, 1);
        j = P(idx, 2);
        hessc = zeros(n);
        hessc(i, i) = -2*V(i, 1)^2 - 2*V(i, 2)^2 - 2*V(i, 3)^2;
        hessc(i, j) = 2*V(i, 1)*V(j, 1) + 2*V(i, 2)*V(j, 2) + 2*V(i, 3)*V(j, 3);
        hessc(j, i) = 2*V(i, 1)*V(j, 1) + 2*V(i, 2)*V(j, 2) + 2*V(i, 3)*V(j, 3);
        hessc(j, j) = -2*V(j, 1)^2 - 2*V(j, 2)^2 - 2*V(j, 3)^2;
        hesscsp = sparse(hessc);
        h = h + lambda.ineqnonlin(idx) * hesscsp;
%         h = h + lambda.ineqnonlin(idx) * hessc;
    end
end