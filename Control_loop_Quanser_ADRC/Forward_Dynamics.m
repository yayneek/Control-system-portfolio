clear; clc
%Czas:
t0 = 0; dt = 0.025; tk = 10;
t = t0:dt:tk;

%Szukane wektory:
q = zeros(15, length(t));
v = zeros(15, length(t));
lagrange = zeros(11, length(t));

%Znane wektory:
u = load('u.mat');
u = u.u;
traj = load('traj.mat');

r = traj.r;
%u = zeros(2,length(t));

%Parametry mechanizmu:
l = 0.127;
L = l*2;
m1 = 0.065;
m2 = 0.5*m1;
J = 9.5e-5;
g = 9.81;
M = diag([m1,m1,J, m1,m1,J, m1,m1,J, m1,m1,J, m2,m2,m2]);

%warunki początkowe:
q0 = [0; -l/2; 3/2*pi; l/2; -l; 0; l; -l/2; pi/2; 3/2*l;0;0;-L; l; -l];
v0 = zeros(15,1);
q(:,1) = q0;
v(:,1) = v0;
lagrange(11,1) = m2*g;


%Rozwiązanie iteracyjne;
initial_guess = [q(:,1);v(:,1);lagrange(:,1)];
options = optimset('Display','off');
exitflag = zeros(1,length(t)-1);
for i = 1:length(t)-1
    func = @(unknowns)FD(unknowns, q, v, u, i, dt, M,l,L);
    [solution, fval, exitflag(i)] = fsolve(func, initial_guess, options);
    initial_guess = solution;
    q(:,i+1) = solution(1:15);
    v(:,i+1) = solution(16:30);
    lagrange(:,i+1) = solution(31:end);
end



figure()
plot(t, q(13,:))
title('z(t)')
grid on

figure()
plot(t, lagrange(11,:));
title('Napięcie w linie')
grid on

figure()
plot(r(1,:), r(2,:), q(14,:), q(15,:));
legend('Trajektoria zadana','Trajektoria zrealizowana')
grid on

dx = zeros(1,length(t));
dy = zeros(1,length(t));
Px = zeros(1, length(t));
Py = zeros(1, length(t));

for i = 1:length(t)
    
    dx(i) = (r(1,i) - q(14,i));
    dy(i) = (r(2,i) - q(15,i));
    Px(i) = (cos(q(3,i)) * l + cos(q(6,i)) * l);
    Py(i) = (sin(q(3,i)) * l + sin(q(6,i)) * l);
end
figure()
plot(t, dx, t, dy)
grid on
legend('dx','dy')
ylabel('e[m]')


%%
folder = 'C:\Users\janek\Desktop\Publikacja\Kod\Wykresy';
Case = 'line';
close all

figure()
plot(t, u)
title('$u(t)$','Interpreter','latex', 'FontSize',16)
grid on
legend('$u_1$','$u_2$','Interpreter','latex', 'FontSize',16, 'location','northwest')
ylabel('$u[Nm]$','Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$','Interpreter','latex', 'FontSize',16)

filename = 'u(t)_';
fullfile_pdf = fullfile(folder, [append(filename, Case) '.pdf']);
exportgraphics(gcf, fullfile_pdf);



figure()
plot(t, dx, t, dy)
title('$e(t)$','Interpreter','latex', 'FontSize',16)
grid on
legend('$e_x$','$e_y$','Interpreter','latex', 'FontSize',16, 'location','northwest')
ylabel('$e[m]$','Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$','Interpreter','latex', 'FontSize',16)

filename = 'e(t)_';
fullfile_pdf = fullfile(folder, [append(filename, Case) '.pdf']);
exportgraphics(gcf, fullfile_pdf);



figure()
plot(t, lagrange(11,:))
grid on
title('$\lambda (t) -$ Tension force in the rope','Interpreter','latex', 'FontSize',16)
ylabel('$\lambda[N]$','Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$','Interpreter','latex', 'FontSize',16)

filename = 'lag(t)_';
fullfile_pdf = fullfile(folder, [append(filename, Case) '.pdf']);
exportgraphics(gcf, fullfile_pdf);


figure()
plot(q(14,:), q(15,:), Px, Py)
grid on
title('Location of the load','Interpreter','latex', 'FontSize',16)
xlabel('$x[m]$','Interpreter','latex', 'FontSize',16)
ylabel('$y[m]$','Interpreter','latex', 'FontSize',16)
legend('Load','Characteristic point','Interpreter','latex', 'FontSize',16)

filename = 'XY_';
fullfile_pdf = fullfile(folder, [append(filename, Case) '.pdf']);
exportgraphics(gcf, fullfile_pdf);


figure()
plot(t, q(13,:))
grid on
title('$z(t)$','Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$','Interpreter','latex', 'FontSize',16)
ylabel('$z[m]$','Interpreter','latex', 'FontSize',16)

filename = 'z(t)_';
fullfile_pdf = fullfile(folder, [append(filename, Case) '.pdf']);
exportgraphics(gcf, fullfile_pdf);

figure()
plot(r(1,:), r(2,:), q(14,:), q(15,:))
grid on
title('Desired and output trajectories','Interpreter','latex', 'FontSize',16)
xlabel('$x[m]$','Interpreter','latex', 'FontSize',16)
ylabel('$y[m]$','Interpreter','latex', 'FontSize',16)
legend('Desired trajectory','Output of the system','Interpreter','latex', 'FontSize',16)

filename = 'traj_';
fullfile_pdf = fullfile(folder, [append(filename, Case) '.pdf']);
exportgraphics(gcf, fullfile_pdf);

Animacja3d(q,l,L,t,dt,r);

function solution = FD(unknowns, q, v, u, i, dt, M, l, L)
Q = unknowns(1:15);
V = unknowns(16:30);
Lag = unknowns(31:end);

m2 = M(13,13);
g = 9.81;

F = [0;0;u(1,i+1); 0;0;0; 0;0;0; 0;0;u(2,i+1); -m2*g;0;0];
C = Phiq([Q(1:13); Q(14:15)],l);
wiezy = Phi(Q(1:13),Q(14:15),l,L);

alpha = 100;
beta = 100;

A = [M C'; C zeros(11,11)];
b = [F;Gamma(Q,V,l) - 2*alpha*C*V - beta^2*wiezy];
x = A\b;

a = x(1:15);
lagrange = x(16:end);

solution = [
V - (Q - q(:,i))/dt;
a - (V - v(:,i))/dt;
Lag - lagrange;
];

end
