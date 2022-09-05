function [f, gradf] = obj(w, p, n)
    f = sum(w.*p);
    if nargout > 1
        gradf = p;
    end
end