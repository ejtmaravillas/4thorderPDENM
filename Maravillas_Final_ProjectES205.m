clear
clc
close all

%% Given values

deltaX = 5;             % 5 cm gap between points in the beam
deltaT = 1;             % 1 sec time interval

tMin = 0;               % start time
tMax = 50;               % after 5 sec, find beam deflection
                        % may also increase depending on time observation

xMin = 0;               % start length
xMax = 95;              % total length of the beam

Nt = tMax/deltaT;       % number of time interval/s
Nx = xMax/deltaX;       % number of x division/s in the beam

t = linspace(tMin, tMax, Nt + 1);  %t values
x = linspace(xMin, xMax, Nx + 1);  %x values


%% Initial Conditions

y = zeros(Nt + 1, Nx + 1); % zero matrix with Nt and Nx dimension

% y(i,j)
y(1,:) =  yInit(x,Nx);      % Solve inital values for the beam deflection...

%% Solve the PDE Numerically                        

% iterate through time interval values from 1 to tMax
for i = 2:Nt+1
    % iterate through spatial values x from 0 to xMax (beam length)
    for j = 1:Nx+1
        % Boundary conditions
        
        if(j == 1 || j == Nx+1) % Outside Boundary
            y(i,j) = 0;
        elseif(i == 2) % special condition at t == 1
            YxSum = Yx(y,i,j,Nx);
            y(i,j) = -((deltaT^2)/(deltaX^4))*YxSum + 2*(y(i-1,j)) - y(i-1,j);
        else % Inside Boundary
            YxSum = Yx(y,i,j,Nx);
            y(i,j) = -((deltaT^2)/(deltaX^4))*YxSum + 2*(y(i-1,j)) - y(i-2,j);
        end
    end
end

%% deflection
ydef = zeros(Nt+1,Nx+1);
for v = 2:Nt+1 
    for z = 1:Nx+1
        ydef(v,z) = y(1,z) - y(v,z);
    end
end
%% PLOT Results
figure

for p = 2:deltaT:Nt+1
    clf
    hold on
    
    yTPlot = y(p,:); % in every loop, get the set of y values in every t interval
    
    plot(x,y(1,:),'red','LineWidth',4)
    plot(x, yTPlot,'LineWidth',2)
    
    title('Y plot origin vs Y deflection after time t')
    xlabel('x in cm')
    ylabel('t in sec')
    
    grid on 
    
    drawnow()
    pause(0.5) %% play with these for faster rendering of figure
end

%% DEFLECTION
figure

for p = 1:deltaT:Nt
    clf
    hold on
    
    yTPlot1 = ydef(p,:); % in every loop, get the set of y values in every t interval
    
    plot(x,y(1,:),'cyan','LineWidth',4)
    plot(x, yTPlot1,'LineWidth',2)
    
    title('Y plot origin vs Y deflection difference after time t')
    xlabel('x in cm')
    ylabel('t in sec')
    
    grid on 
    
    drawnow()
    pause(1) %% play with these for faster rendering of figure
end









                           
                           
                           