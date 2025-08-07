clear; clc
%Czas symulacji:
t0 = 0;
tk = 10;
dt = 0.01;
time = t0:dt:tk;

%Dwa wózki polaczone sprezyna
m1 = 1;
m2 = 2;
l0 = 0.5;
c = 10;
d = 2;
M = @(q)[m1, 0; 0, m2];
k = @(q, v)[0;0];
g = @(q, v)[c*(q(2) - q(1) - l0) + d*(v(2) - v(1)); -c*(q(2) - q(1) - l0) - d*(v(2) - v(1))];
B = [1;0];


% Zmienne dynamiczne:
m = rank(B);
n = length(M(ones(10,10)));
q = zeros(n, length(time)); %Wspolrzedne do dynamiki odwrotnej
v = zeros(n, length(time)); %Prędkości do dynamiki odwrotnej 
u = zeros(m, length(time)); %Sygnały sterujące 
q(:,1) = [0; l0];

% Zadawanie trajektorii:
[y, yd, ydd, yd3, yd4] = Trajectory_v2(t0, dt,tk, l0, 3, 6);
% Trajectory(t0, tk, dt, starting_point, rest_point, setting_time)


% Warunki początkowe:
initial_guess = zeros(5,1);
initial_guess(1) = 0;
initial_guess(2) = l0;


% Opcje do solvera:
options = optimset('Display','off', 'TolFun', 1e-10, 'TolX', 1e-6, 'MaxIter', 1000, 'MaxFunEvals', 5000);
N = 1;

%Solver
for i = 1:length(time)-1
    func = @(unknowns) Inverse_Dynamics_v2(unknowns, M(q(:,i)), g(q(:,i), v(:,i)), k(q(:,i), v(:,i)), B, y, ydd, q, v, i, dt, N);
    [solution,fval(:,i), exitflag(i)] = fsolve(func, initial_guess, options);
    initial_guess = solution;
    u(:, i+1) = solution(2*n+1:2*n+m);
    q(:, i+1) = solution(1:n);
    v(:, i+1) = solution(n+1:2*n);
    fval_norm(i) = norm(fval(:,i));
    disp(i)
end

%Wykresy
close all
figure()
plot(time, q)
grid on
legend('q1','q2')
title('q(t)')



figure()
plot(time, u)
grid on
title('u(t)')



%% Weryfikacja Fwd_Dyn
Q = zeros(2, length(time));
V = zeros(2, length(time));
kappa = 1;
for i=1:length(time)
    [Q(:,i), V(:,i)] = Forward_Dynamics(N, M(q(:,i)), k(q(:,i), v(:,i)), g(q(:,i), v(:,i)), B, u, q, v, i, dt);
end

close all
figure()
plot(time, Q)
grid on
legend('q1','q2')
title('q(t)')
