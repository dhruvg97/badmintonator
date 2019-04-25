function [t,z] = ivpSolverXYZ(t0,z0,dt,tend)
%% ivpSolver    Solve an initial value problem (IVP) and plot the result
% 
%     [T,Z] = ivpSolver(T0,Z0,DT,TE) computes the IVP solution using a step 
%     size DT, beginning at time T0 and initial state Z0 and ending at time 
%     TEND. The solution is output as a time vector T and a matrix of state 
%     vectors Z.

% Set initial conditions
t(1) = t0;
z(:,1) = z0;

% Continue stepping until the end time is exceeded
n=1;
while z(3,:) >= 0
    % Increment the time vector by one time step
    t(n+1) = t(n) + dt;
    
    % Apply Euler's method for one time step
    z(:,n+1) = stepRungeKuttaXYZ(t(n), z(:,n), dt);
    
    n = n+1;
end

%Plot the result
%plot3(z(1,:),z(5,:),z(3,:))
%grid on
%hold on
%pause(0.5)
%rotate3d on
