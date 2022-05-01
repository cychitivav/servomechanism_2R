function [x y] = path(s)
    a = 15;
    b = 7.9;
    beta = rand(1)*4*pi;
    k = 4;
    
    theta = reshape(s*2*pi,[],1);
    rho = a+b*cos(k*theta+beta);
    
    [x,y] = pol2cart(theta,rho);

    x = x + 50;
    y = y + 55;
end