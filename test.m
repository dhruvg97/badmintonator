%Test script
t0=0; %intial time
tend = 2; %final time
dt = 0.001;


guess1 = 0.0792; %first arbitrary guess
z0=[-2.1;75*cos(guess1);1;75*sin(guess1)];%intial state values
[t,z]=ivpSolver2(t0,z0,dt,tend);
hold on
plot(z(1,:),z(3,:))
plot (0,1.524,'r*')
z(1,end)