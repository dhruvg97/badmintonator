function [theta0,ImpVel] = Shooting(dest)
%% Shooting fucntion used to find the necessary pitch angle for a desired location on court 
% Takes the desired serve location on the court as the input dest
% outputs  the angle from the horizontal in degrees the impact velocity in m/s and
%% Stating intial conditions

t0=0; %intial time
tend = 2; %final time
dt = 0.001; %time step
error = []; %error array
guess=[pi/6,pi/15]; %first 2 arbitrary guesses
%% Finding the error in the first 2 guesses

z0=[-2.1;75*cos(guess(1));1;75*sin(guess(1))]; %intial state values
[t,z] = ivpSolver2(t0,z0,dt,tend); 
error =[error,z(1,end)-dest ]; %find the error in the guess

z0=[-2.1;75*cos(guess(2));1;75*sin(guess(2))]; %intial state values
[t,z] =ivpSolver2(t0,z0,dt,tend);
error = [error, z(1,end)-dest]; %find the error in the guess
%% Iterating until the error is less than 0.0001

while abs(error(end))>0.0001 
    nextGuess = guess(end)-error(end)*((guess(end)-guess(end-1))/(error(end)-error(end-1))); % formula for the next guess
    guess = [guess,nextGuess];
    z0=[-2.1;75*cos(guess(end));1;75*sin(guess(end))];
    [t,z] = ivpSolver2(t0,z0,dt,tend);
    error =[error, z(1,end)-dest]; %find the error in the guess
    
end
%% Plot the trajectory of the shuttlecock indicating the stable and unstable regions along the impact speed

unStable = find(t<=50e-3);

%Plot the unstable region
plot(z(1,unStable(1):unStable(end)),z(3,unStable(1):unStable(end)),'m')
hold on
grid on
grid minor
xlabel('Distance along the court /m')
ylabel('Vertical Distance /m')
title('Path of a shuttlecock in the X-Y plane')
%plot the stable region
plot(z(1,unStable(end):end),z(3,unStable(end):end),'g')
%plot the height of the net
net =[0,0;0,1.524];
plot(net(1,:),net(2,:),'r--')
%plot end point of trajectory
plot(z(1,end),z(3,end),'k*')
% Impact velocity
ImpVel = sqrt(z(2,end)^2+z(4,end)^2); %Impact velocity in m/s
legend('Unstable region of flight','Stable region of flight','Net position',['Impact Velocity of ' num2str(ImpVel) ' /ms^{-1}'])
hold off
%% Outputs of the function
theta0 = guess(end)*(180/pi); %value for the desired angle in degrees

