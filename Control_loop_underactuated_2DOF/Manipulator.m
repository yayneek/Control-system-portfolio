clear; clc
%Czas symulacji:
t0 = 0;
tk = 10;
dt = 0.01;
time = t0:dt:tk;

%Manipulator z pasywnym złączem:
l1 = 1;
l2 = 1;
m1 = 2;
m2 = 2;
c = 1;
d = .2;
J1 = m1*l1^2/12;
J2 = m2*l2^2/12;
s1 = l1/2;
s2 = l2/2;
M = @(q)[J1+m1*s1^2+m2*l1^2, m2*s2*l1*cos(q(2)-q(1));m2*s2*l1*cos(q(2)-q(1)), J2+m2*s2^2];
k = @(q, v)[-m2*s2*l1*v(2)^2*sin(q(2)-q(1)); m2*s2*l1*v(1)^2*sin(q(2)-q(1))];
g = @(q, v)[c*(q(2) - q(1))+ d*(v(2) - v(1)); -c*(q(2) - q(1))- d*(v(2) - v(1))];
B = [1; 0];

m = rank(B);
n = length(M(ones(10,10)));

% Zmienne dynamiczne:
q = zeros(n, length(time)); %Wspolrzedne do dynamiki odwrotnej
v = zeros(n, length(time)); %Prędkości do dynamiki odwrotnej 
u = zeros(m, length(time)); %Sygnały sterujące 


% Zadawanie trajektorii:
[y, yd, ydd, yd3, yd4] = Trajectory_v2(t0, dt,tk, 0, pi, 6);
% Trajectory(t0, tk, dt, starting_point, rest_point, setting_time)


% Warunki początkowe:
initial_guess = zeros(5,1);

% Opcje do solvera:
options = optimset('Display','off', 'TolFun', 1e-6, 'TolX', 1e-6, 'MaxIter', 1000, 'MaxFunEvals', 5000);
N = 5;

kappa = 0.3;
H = [(1-kappa) kappa];
for i = 1:length(time)-1
    func = @(unknowns) Inverse_Dynamics_v2(unknowns, M(q(:,i)), g(q(:,i), v(:,i)), k(q(:,i), v(:,i)), B, y, ydd, q, v, i, dt, N);
    solution = fsolve(func, initial_guess, options);
    initial_guess = solution;
    u(:, i+1) = solution(2*n+1:2*n+m);
    q(:, i+1) = solution(1:n);
    v(:, i+1) = solution(n+1:2*n);
end

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


[P1, P2, P] = Points_On_Plane(q, l1, l2);
figure()
plot(P1(1,:), P1(2,:), P2(1,:), P2(2,:), P(1,:), P(2,:));
legend('P1','P2','Punkt P');
grid on
xlim([-l1-l2, l1+l2]);
ylim([-l1-l2, l1+l2]);
xlabel('x[m]')
ylabel('y[m]')

%% Wykresy do pracy
folder = 'C:\Users\janek\Desktop\Magisterka\v3\wykresy\Manipulator';
close all

figure()
plot(time, q)
grid on
legend('$\theta_1$','$\theta_2$', 'Interpreter','latex', 'FontSize',16, 'Location', 'southeast')
title('$\textbf{q}(t)$', 'Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$\textbf{q}[rad]$','Interpreter','latex', 'FontSize',16)
filename = 'q(t)';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);

figure()
plot(time, v)
grid on
legend('$\dot{\theta_1}$','$\dot{\theta_2}$', 'Interpreter','latex', 'FontSize',16, 'Location', 'southeast')
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
ylabel('$u[Nm]$','Interpreter','latex', 'FontSize',16)
filename = 'u(t)';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);


figure()
plot(P(1,:), P(2,:), P2(1,:), P2(2,:))
grid on
legend('Point P', 'End of the second link','Interpreter','latex', 'FontSize',16, 'Location','northeast')
title('Points on plane','Interpreter','latex', 'FontSize',16)
xlim([-l1-l2, l1+l2]);
ylim([-l1/2, l1+l2*2]);
xlabel('$x[m]$','Interpreter','latex', 'FontSize',16)
ylabel('$y[m]$','Interpreter','latex', 'FontSize',16)
filename = 'points';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);

figure()
plot(time, (1-kappa)*q(1,:) + kappa*q(2,:))
grid on
title('$\gamma(t)$','Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$', 'Interpreter','latex', 'FontSize',16)
ylabel('$\gamma[rad]$','Interpreter','latex', 'FontSize',16)
filename = 'gamma';
fullfile_pdf = fullfile(folder, [filename '.pdf']);
exportgraphics(gcf, fullfile_pdf);
%% Animacja
figure;
axis equal;
grid on;
xlabel('X Axis');
ylabel('Y Axis');
title('2DOF Manipulator Animation');
xlim([-l1-l2, l1+l2]);
ylim([-l1-l2, l1+l2]);
hold on;
animacja = VideoWriter('2DOF_manipulator_animation.mp4', 'MPEG-4');
animacja.FrameRate = 30;
open(animacja);

for i = 1:length(time)
    plot([0, P1(1,i), P2(1,i)], [0, P1(2,i), P2(2,i)], '-o', 'LineWidth', 2, 'MarkerSize', 6);
    plot(cos(q(1,:))*l1 + l2*cos(q(2,:))/2, sin(q(1,:))*l1 + sin(q(2,:))*l2/2, '--');
    plot(P(1,i), P(2,i), 'o','LineWidth',4, 'MarkerSize',3);
    legend('','desired trajectory','Point P',Location='northwest')
    hold on;
    text(-3.2*l2,1.3*l2, ['Time: ' num2str(time(i), '%.2f') ' s'], 'FontSize', 12, 'Color', 'k');
    
    pause(dt); 
    frame = getframe(gcf);
    if i < length(time)
        cla; % Clear axes for the next frame
    end
    writeVideo(animacja, frame);
end
close(animacja);
%% Weryfikacja Fwd_Dyn
Q = zeros(2, length(time));
V = zeros(2, length(time));
kappa = 1;
for i=1:length(time)
    [Q(:,i), V(:,i)] = Forward_Dynamics(N, M(q(:,i)), g(q(:,i), v(:,i)), k(q(:,i), v(:,i)), u, 0, q, v, i, dt);
    Y(i) = [1 - kappa kappa]*inv(M(q(:,i))) * B;
end
plot(time, Y)