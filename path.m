function [x, y] = path(s)
    Lmax = 0.221;
    a = 0.09;
    b = Lmax/2-a;
    beta = rand(1)*pi-pi/2;
    k = 4;
    
    theta = reshape(s-beta,[],1);
    rho = a+b*cos(k*(theta+beta));
    
    [x,y] = pol2cart(theta,rho);

    x = x + 0.1605;
    y = y + 0.3;
end