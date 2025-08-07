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
M_real =@(q) 1.1*[mc+mp, mp*l*cos(q(2)); mp*l*cos(q(2)), mp*l^2];

m = rank(B);
n = length(M(ones(10,10)));

% Zmienne dynamiczne:
q_inv = zeros(n, length(time)); %Wspolrzedne do dynamiki odwrotnej
v_inv = zeros(n, length(time)); %Prędkości do dynamiki odwrotnej 
 
q = zeros(n, length(time));
v = zeros(n, length(time));

u = zeros(m, length(time));
u_ffw = zeros(m, length(time));
u_fb = zeros(m, length(time));

e = zeros(m, length(time));
e_int = zeros(m, length(time));
e_dif = zeros(m, length(time));

% Zadawanie trajektorii:
[y, yd, ydd, yd3, yd4] = Trajectory_v2(t0, dt,tk, 0, pi/3, 6);
% Trajectory(t0, tk, dt, starting_point, rest_point, setting_time)


% Warunki początkowe:
initial_guess = zeros(5,1);

% Opcje do solvera:
options = optimset('Display','off', 'TolFun', 1e-6, 'TolX', 1e-6, 'MaxIter', 1000, 'MaxFunEvals', 5000);
N = 1;

%Nastawy regulatora:
K = 0;
P = 200;
I = 50;
D = 100;
for i = 1:length(time)-1
    func = @(unknowns) Inverse_Dynamics_v2(unknowns, M(q_inv(:,i)), g(q_inv(:,i), v_inv(:,i)), k(q_inv(:,i), v_inv(:,i)), B, y, ydd, q_inv, v_inv, i, dt, N);
    solution = fsolve(func, initial_guess, options);
    initial_guess = solution;
    u_ffw(:, i+1) = solution(2*n+1:2*n+m);
    q_inv(:, i+1) = solution(1:n);
    v_inv(:, i+1) = solution(n+1:2*n);
    
    %Wyznaczenie uchybu
    u_fb(i+1) = -(P*e(i) + I*e_int(i) + D*e_dif(i));

    %Węzeł sumujący:
    u(i+1) = u_ffw(i+1) + u_fb(i+1);

    %Obiekt rzeczywisty:
    [q(:, i+1), v(:, i+1)] = Forward_Dynamics(N,M_real(q(:,i)), k(q(:,i), v(:,i)), g(q(:,i), v(:,i)), B, u, q, v, i, dt);

    %Uchyb:
    e(i+1) = y(i) - q(2,i);
    e_int(i+1) = e_int(i)+e(i+1);
    e_dif(i+1) = yd(i) - v(2,i);
end

close all

folder = 'C:\Users\janek\Desktop\Magisterka\v3\wykresy\Cart-PolePID';
figure()
plot(time, e,'--')
title('uchyb')

figure()
plot(time, y, '--',time, q(2,:),'o')
legend('y','q')

figure()
plot(time, u_fb)

%%
close all
figure()
plot(time, e)
grid on
title('$e(t)$', 'Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$e[m]$','Interpreter','latex', 'FontSize',16)
filename = 'e(t)';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);

figure()
plot(time, u_ffw, time, u_fb)
grid on
title('$u(t)$', 'Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$u[N]$','Interpreter','latex', 'FontSize',16)
legend('$u_{ffw}$','$u_{fb}$', 'Interpreter', 'latex','FontSize',16, 'Location','southwest')
filename = 'ufbffw(t)';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);

figure()
plot(time, u_fb)
grid on
title('$u_{fb}(t)$', 'Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$u_{fb}[N]$','Interpreter','latex', 'FontSize',16)
filename = 'ufb(t)';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);



