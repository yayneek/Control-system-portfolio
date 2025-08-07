clear; clc;
%Czas:
t0 = 0; dt = 0.01; tk = 10;
t = t0:dt:tk;

%Parametry mechanizmu:
l = 0.127;
L = l*2;
m1 = 0.065;
m2 = 0.5*m1;
J = 9.5e-5;
g = 9.81;
M = diag([m1,m1,J, m1,m1,J, m1,m1,J, m1,m1,J, m2,m2,m2]);

%warunki początkowe:
q0 = [0; -l/2; 3/2*pi;      l/2; -l; 0;     l; -l/2; pi/2;      3/2*l;0;0;    -L; l; -l];
v0 = zeros(15,1);
initial_guess = [q0;v0];

%Znane wektory:
u = load('u.mat');
u = u.u;
%u = zeros(2, length(t));
traj = load('traj.mat');  
r = traj.r;
%u = [zeros(1, length(t)); zeros(1, length(t)) * 7.5e-5];

%ODE45:
options = odeset('RelTol',1e-12,'AbsTol',1e-16);
[t, sol] = ode113(@(t, y) ode_system(t, y, u, M, l, L, t0, tk), t, initial_guess, options);

%Wyniki:
q = sol(:, 1:15)';
v = sol(:, 16:30)';

figure()
plot(t, q(13,:))
title('z(t)')
grid on


figure()
plot(r(1,:), r(2,:), q(14,:), q(15,:));
legend('Trajektoria zadana','Trajektoria zrealizowana')
grid on

dx = zeros(1,length(t));
dy = zeros(1,length(t));
for i = 1:length(t)
    dx(i) = abs((r(1,i) - q(14,i))/r(1,i)) * 100;
    dy(i) = abs((r(2,i) - q(15,i))/r(2,i)) * 100;
end
figure()
plot(t, dx, t, dy)
grid on
legend('dx','dy')
ylabel('e[%]')

%Animacja3d(q(1:13,:),l,L,t,dt,q(14:15,:));


function dydt = ode_system(t, y, u, M, l, L, t0, tk)

   
    q = y(1:15);
    v = y(16:30);

    m2 = M(13,13);
    g = 9.81;

    %Interpolacja sterowania u(t)
    u1 = interp1(linspace(t0, tk, length(u(1,:))), u(1,:), t);
    u2 = interp1(linspace(t0, tk, length(u(2,:))), u(2,:), t);


    F = [0;0;u1; 0;0;0; 0;0;0; 0;0;u2; -m2*g;0;0];
    C = Phiq(q(1:13), q(14:15), l);
    wiezy = Phi(q(1:13), q(14:15), l, L);

    alpha = 100;
    beta = 100;

    A = [M C'; C zeros(11,11)];
    b = [F; Gamma(q, v, l) - 2*alpha*C*v - beta^2*wiezy];
    x = A\b;
    
    a = x(1:15);
    lagrange = x(16:end);
    dydt = [v; a];


  
   
end