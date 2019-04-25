function znext = stepRungeKuttaXYZ(t,z,dt)
% stepRunge Kutta   Compute one step using the RUnge Kutta method
% 
%     ZNEXT = stepEuler(T,Z,DT) computes the state vector ZNEXT at the next
%     time step T+DT

% Calculate the state derivative from the current state
dz = stateDerivXYZ(t, z);

% Calculate the next state vector from the previous one using Euler's
% update equation
A = dt*dz;
B = dt*stateDerivXYZ(t+dt/2,z+A/2);
C = dt*stateDerivXYZ(t+dt/2,z+B/2);
D = dt*stateDerivXYZ(t+dt,z+C);

znext = z + (1/6)*(A + 2*B +2*C +D);

