function sphere_plt(S, r, n)
    figure;
    [x, y, z] = sphere;
    surf(x*r(1)+S(1,1), y*r(1)+S(1,2), z*r(1)+S(1,3));
    hold on;
    for i = 2:n
        surf(x*r(i)+S(i, 1), y*r(i)+S(i, 2), z*r(i)+S(i, 3));
    end
    daspect([1 1 1]);
    view(30,10);
end