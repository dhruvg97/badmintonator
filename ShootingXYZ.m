function [theta01,theta02,ImpVel] = ShootingXYZ(z05,dest)
%% Shooting method used to solve the boundary value in the 3D case
% Takes inputs [z05,dest] where z05 = the intial serve destination in the z
% direction and dest = [xf,zf] where xf if the x destiantion of the serve
% and zf is the z dimension of the serve location

% Outputs the angles between the horizontal and the direction in the x-y plane and
% the angle between the vertical and the directions in the z-x plane

%% Assaigning Intial variables
t0=0; %intial time
tend = 2; %final time
dt = 0.001; %time step
error = nan(2,1); % row 1 = x-y angle error, row 2 = z-x angle 
guess =[pi/5, pi/15; pi/15, -pi/30];%arbitrary guesses for both angles

%% Finding the error in both aribtrary guesses

z0=[-2.1;75*cos(guess(1,1))*cos(guess(2,1));1;75*sin(guess(1,1))*cos(guess(2,1));z05;75*sin(guess(2,1))*cos(guess(1,1))];%intial state values
[t,z] = ivpSolverXYZ(t0,z0,dt,tend);
error = [error(1,:),z(1,end)-dest(1); error(2,:),z(5,end)-dest(2)]; % row 1 = x-y angle error, row 2 = z-x angle

z0=[-2.1;75*cos(guess(1,2))*cos(guess(2,2));1;75*sin(guess(1,2));z05;75*sin(guess(2,2))];%intial state values
[t,z] =ivpSolverXYZ(t0,z0,dt,tend);
error = [error(1,:), z(1,end)-dest(1); error(2,:),z(5,end)-dest(2)];% row 1 = x-y angle error, row 2 = z-x angle
  
%% Iterating through the shooting formula until the error is below the desired value of 0.001

while abs(error(1,end))>0.0001 && abs(error(2,end))>0.0001 
    
    nextGuess1 = guess(1,end)-error(1,end)*((guess(1,end)-guess(1,end-1))/(error(1,end)-error(1,end-1)));% next guess for x-y angle
    nextGuess2 = guess(2,end)-error(2,end)*((guess(2,end)-guess(2,end-1))/(error(2,end)-error(2,end-1)));% next angle for z-x angle
    guess = [guess(1,:),nextGuess1; guess(2,:),nextGuess2];
    z0=[-2.1;75*cos(guess(1,end))*cos(guess(2,end));1;75*sin(guess(1,end))*cos(guess(2,end));z05;75*sin(guess(2,end))*cos(guess(1,end))];
    [t,z] = ivpSolverXYZ(t0,z0,dt,tend);
    error = [error(1,:),z(1,end)-dest(1);error(2,:),z(5,end)-dest(2)]; % row 1 = x-y angle error, row 2 = z-x angle
   
end
%outputs for the fucntion
theta01 = guess(1,end)*(180/pi);
theta02 = guess(2,end)*(180/pi);
ImpVel = sqrt(z(2,end)^2+z(4,end)^2+z(6,end));

