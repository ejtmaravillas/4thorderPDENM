function YxSum = Yx(y,i,j,Nx)
    
    %Outside Boundary Conditions
    if(j-2<1)
        YxSum = y(i-1,j+2) - 4*(y(i-1,j+1)) + 6*(y(i-1,j)) - 4*(y(i-1,j-1)) + y(i-1,j-1);
    elseif(j+2 > Nx)
        YxSum = y(i-1,j+1) - 4*(y(i-1,j+1)) + 6*(y(i-1,j)) - 4*(y(i-1,j-1)) + y(i-1,j-2);
    else
        YxSum = y(i-1,j+2) - 4*(y(i-1,j+1)) + 6*(y(i-1,j)) - 4*(y(i-1,j-1)) + y(i-1,j-2);
    end
end