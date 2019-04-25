function znext = stepRungeKutta2(t,z,dt)
%% stepRunge Kutta   Compute one step using the Runge Kutta 4 method
% 
%     ZNEXT = stepRungeKutta2(T,Z,DT) computes the state vector ZNEXT at the next
%     time step T+DT

%% Calculate the state derivative from the current state
dz = stateDeriv2(t, z);

%% Calculate the next state vector from the previous one using Runge Kutta 4
% update equation
A = dt*dz;
B = dt*stateDeriv2(t+dt/2,z+A/2);
C = dt*stateDeriv2(t+dt/2,z+B/2);
D = dt*stateDeriv2(t+dt,z+C);

znext = z + (1/6)*(A + 2*B +2*C +D);

