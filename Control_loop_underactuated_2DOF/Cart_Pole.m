clear; clc
%Czas symulacji:
t0 = 0;
tk = 10;
dt = 0.01;
time = t0:dt:tk;

%Cart-Pole:
mp = 5;
mc = 5;
l = 0.4;
G = 9.81;

M = @(q)[mc+mp, mp*l*cos(q(2)); mp*l*cos(q(2)), mp*l^2];
g = @(q, v)[0, -mp*l*sin(q(2))*v(2); 0, 0]*v;
k = @(q, v)[0, mp*G*l*sin(q(2))]';
B = [1; 0];

m = rank(B);
n = length(M(ones(10,10)));

% Zmienne dynamiczne:
q = zeros(n, length(time)); %Wspolrzedne do dynamiki odwrotnej
v = zeros(n, length(time)); %Prędkości do dynamiki odwrotnej 
u = zeros(m, length(time)); %Sygnały sterujące 


% Zadawanie trajektorii:
[y, yd, ydd, yd3, yd4] = Trajectory_v2(t0, dt,tk, 0, pi/3, 6);
% Trajectory(t0, tk, dt, starting_point, rest_point, setting_time)


% Warunki początkowe:
initial_guess = zeros(5,1);

% Opcje do solvera:
options = optimset('Display','off', 'TolFun', 1e-6, 'TolX', 1e-6, 'MaxIter', 1000, 'MaxFunEvals', 5000);
N = 1;


for i = 1:length(time)-1
    func = @(unknowns) Inverse_Dynamics_v2(unknowns, M(q(:,i)), g(q(:,i), v(:,i)), k(q(:,i), v(:,i)), B, y, ydd, q, v, i, dt, N);
    solution = fsolve(func, initial_guess, options);
    initial_guess = solution;
    u(:, i+1) = solution(2*n+1:2*n+m);
    q(:, i+1) = solution(1:n);
    v(:, i+1) = solution(n+1:2*n);
end

close all

folder = 'C:\Users\janek\Desktop\Magisterka\v3\wykresy\Cart-Pole';


figure()
plot(time, q(1,:))
grid on
title('$x(t)$', 'Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$x[m]$','Interpreter','latex', 'FontSize',16)
filename = 'x(t)';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);

figure()
plot(time, q(2,:))
grid on
title('$\theta(t)$', 'Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$\theta[rad]$','Interpreter','latex', 'FontSize',16)
filename = 'theta(t)';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);

figure()
plot(time, v(1,:))
grid on
title('$\dot{x}(t)$', 'Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$\dot{x}[m/s]$','Interpreter','latex', 'FontSize',16)
filename = 'xd(t)';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);

figure()
plot(time, v(2,:))
grid on
title('$\dot{\theta}(t)$', 'Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$\dot{\theta}[rad/s]$','Interpreter','latex', 'FontSize',16)
filename = 'thetad(t)';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);


figure()
plot(time, u)
grid on
title('$u(t)$', 'Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$u[N]$','Interpreter','latex', 'FontSize',16)
filename = 'u(t)';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);
%% Forward Dynamics
Q = zeros(2, length(time));
V = zeros(2, length(time));
kappa = 1;
for i=1:length(time)
    [Q(:,i), V(:,i)] = Forward_Dynamics(N, M(q(:,i)), g(q(:,i), v(:,i)), k(q(:,i), v(:,i)), B, u, q, v, i, dt);
end

