function [f, gradf] = obj(w, q, n)
    f = sum(w.*q);
    if nargout > 1
        gradf = q;
    end
end