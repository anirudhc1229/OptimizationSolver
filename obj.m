function [f, gradf] = obj(w, n)
    f = sum(w);
    if nargout > 1
        gradf = ones([1, n]);
    end
end