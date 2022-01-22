function y = yInit(x,Nx)
    y_init = zeros(1,Nx + 1);
    for n = 2:Nx
%         if (n == 1 || n == Nx + 1)
%             y_init(n) = 0;
%         else
%             y_init(n) = sin((0.5)*pi*(x(n))) + 0.5*sin(3*pi*(x(n)));
%         end
        y_init(n) = sin((0.5)*pi*(x(n))) + 0.5*sin(3*pi*(x(n)));
    end
    y = y_init;
end