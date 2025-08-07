clear; clc
%Czas symulacji:
t0 = 0;
tk = 10;
dt = 0.01;
time = t0:dt:tk;

%Parametry układu:
alfa = deg2rad(30); % - kąt miedzy poziomem a osią sprezyny
m1 = 2;
m2 = 1;
c = 5;
d = 1;

M = @(q)[m1+m2, m2*cos(alfa); m2*cos(alfa), m2];
g = @(q, v)[0; 0];
k = @(q, v)[0; c*q(2)+d*v(2)];
B = [1; 0];

m = rank(B);
n = length(M(ones(10,10)));

% Zmienne dynamiczne:
q = zeros(n, length(time)); %Wspolrzedne do dynamiki odwrotnej
v = zeros(n, length(time)); %Prędkości do dynamiki odwrotnej 
u = zeros(m, length(time)); %Sygnały sterujące 


% Zadawanie trajektorii:
[y, yd, ydd, yd3, yd4] = Trajectory_v2(t0, dt,tk, 0, 5, 6);
% Trajectory(t0, tk, dt, starting_point, rest_point, setting_time)


% Warunki początkowe:
initial_guess = zeros(5,1);

% Opcje do solvera:
options = optimset('Display','off', 'TolFun', 1e-6, 'TolX', 1e-6, 'MaxIter', 1000, 'MaxFunEvals', 5000);
N = 5;


for i = 1:length(time)-1
    func = @(unknowns) Inverse_Dynamics_Masa_na_wozku(unknowns, M(q(:,i)), g(q(:,i), v(:,i)), k(q(:,i), v(:,i)), B, y, ydd, q, v, i, dt, N, alfa);
    [solution,fval(:,i), exitflag(i)] = fsolve(func, initial_guess, options);
    initial_guess = solution;
    u(:, i+1) = solution(2*n+1:2*n+m);
    q(:, i+1) = solution(1:n);
    v(:, i+1) = solution(n+1:2*n);
end
%%
folder = 'C:\Users\janek\Desktop\Magisterka\v3\wykresy\Wozek';
close all

figure()
plot(time, q)
grid on
legend('$x$','$s$', 'Interpreter','latex', 'FontSize',16, 'Location', 'southeast')
title('$\textbf{q}(t)$', 'Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$\textbf{q}[rad]$','Interpreter','latex', 'FontSize',16)
filename = 'q(t)';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);

figure()
plot(time, v)
grid on
legend('$\dot{x}$','$\dot{s}$', 'Interpreter','latex', 'FontSize',16, 'Location', 'southeast')
title('$\textbf{v}(t)$', 'Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$\textbf{q}[rad/s]$','Interpreter','latex', 'FontSize',16)
filename = 'v(t)';
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

figure()
plot(time, q(1,:)+q(2,:)*cos(alfa))
grid on
title('Output of the system $y$(t)', 'Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$y[m]$','Interpreter','latex', 'FontSize',16)
filename = 'y(t)';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);

%% Weryfikacja Fwd_Dyn
Q = zeros(2, length(time));
V = zeros(2, length(time));
kappa = 1;
for i=1:length(time)
    [Q(:,i), V(:,i)] = Forward_Dynamics(N, M(q(:,i)), g(q(:,i), v(:,i)), k(q(:,i), v(:,i)), u, 0, q, v, i, dt);
    Y(i) = [1 - kappa kappa]*inv(M(q(:,i))) * B;
end
plot(time, Y)