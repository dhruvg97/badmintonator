function dz = stateDeriv2(t,z)
%% Calculate the state derivative for a mass-spring-damper system
%     DZ = stateDeriv(T,Z) computes the derivative DZ = [Vx; Ax; Vy; Ay] of the 
%     state vector Z = [Xx; Vx; Xy; Vy], where X is displacement, V is velocity,
%     and A is acceleration.
%% Assigning Variables
M = 0.005; % Mass (kg)
rho = 1.2250; % density at 15 degrees (kg/m^3)
g = 9.80665; % gravitational acceleration at sea level (Ns/m)

%instability conditions
if t<=50e-3
    Area = 0.012; %cross sectional area
    Cd=0.8; %drag coeffieicnt 
else
    Area = 0.009;
    Cd=0.6;
end

K = 0.5*rho*Area*Cd*(1/M);
%% State derivative functions for the problem in 2-dimensions
dz1 = z(2); %Vx
dz2 = -K*(z(2)^2+z(4)^2)*cos(atan2(z(4),z(2))); %Ax
dz3 = z(4); %Vy
dz4 = -g -K*(z(2)^2+z(4)^2)*sin(atan2(z(4),z(2))); %Ay

dz = [dz1; dz2; dz3; dz4];
