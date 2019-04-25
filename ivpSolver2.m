function [t,z] = ivpSolver2(t0,z0,dt,tend)
%% ivpSolver    Solve the initial value problem (IVP) for motion of a shuttlecock in 2D and plot the results
% 
%     [T,Z] = ivpSolver(T0,Z0,DT,TE) computes the IVP solution using a step 
%     size DT, beginning at time T0 and initial state Z0 and ending at time 
%     TEND. The solution is output as a time vector T and a matrix of state 

%% Set initial conditions
t(1) = t0;
z(:,1) = z0;

%% Continue stepping the time until the shuttlecock hits the ground at y=0
n=1;
while z(3,:) > 0
    % Increment the time vector by one time step
    t(n+1) = t(n) + dt;
    
    % Apply the Runge-Kutta method for one time step
    z(:,n+1) = stepRungeKutta2(t(n), z(:,n), dt);
    
    n = n+1;
end

