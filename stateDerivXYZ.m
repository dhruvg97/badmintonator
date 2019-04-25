function dz = stateDerivXYZ(t,z)
%% Calculate the state derivative for shuttlecock moving in 3-dimensions
% 
%     DZ = stateDerivXYZ(T,Z) computes the derivative DZ = [Vx; Ax; Vy; Ay; Vz; Az] of the 
%     state vector Z = [Xx; Vx; Xy; Vy; Xz; Vz], where X is displacement, V is velocity,
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
%% State derivative functions for the 3D problem
dz1 = z(2); %Vx
dz2 = -K*(z(2)^2+z(4)^2+z(6)^2)*cos(atan2(z(4),z(2)))*cos(atan2(z(6),z(2))); %Ax
dz3 = z(4); %Vy
dz4 = -g -K*(z(2)^2+z(4)^2+z(6)^2)*cos(atan2(z(6),z(2)))*sin(atan2(z(4),z(2))); %Ay
dz5 = z(6); %Vz
dz6 = -K*(z(2)^2+z(4)^2+z(6)^2)*cos(atan2(z(4),z(2)))*sin(atan2(z(6),z(2))); %Az

dz = [dz1; dz2; dz3; dz4; dz5; dz6];
