clear; clc
%Czas:
t0=0; dt=0.01; tk=10;
t = t0:dt:tk;

%Parametry mechanizmu:
l = 0.127;
L = l*2;
m1 = 0.065;
m2 = m1*0.5;
g = 9.81;
J = 9.5e-5;

%Szukane wektory:
q = zeros(15,length(t));
v = zeros(15,length(t));
u = zeros(2,length(t));
lagrange = zeros(11, length(t));
lagrange(11,1) = m2*g;


%Położenie początkowe:
q0 = [0; -l/2; 3/2*pi; l/2; -l; 0; l; -l/2; pi/2; 3/2*l;0;0;-L; l;-l];
v0 = zeros(15,1);
q(:,1) = q0;
v(:,1) = v0;


%Trajektoria ładunku:
[traj, rd, traj_dd] = Trajectory_Circle(t0,dt,tk,[l;-l], l/5, 5);

%Sprawdzenie, czy warunki początkowe spełniają więzy:
if norm(Phi(q0,l,L)) > 1e-10
    Phi(q0,l,L)
    error('Warunki początkowe nie spełniają równania więzów!')
end



%Rozwiązanie iteracyjne:
initial_guess = [q0;v0;u(:,1);lagrange(:,1)];
options = optimset('Display','iter', 'TolFun', 1e-10, 'TolX', 1e-6, 'MaxIter', 1000, 'MaxFunEvals', 50000);

for i=1:length(t)-1
func = @(unknowns)ID(unknowns, q,v,i,dt,l,L,traj,traj_dd,m1,m2);
[solution, fval(:,i), exitflag(i)] = fsolve(func, initial_guess, options);
initial_guess = solution;

q(:,i+1) = solution(1:15);
v(:,i+1) = solution(16:30);
u(:,i+1) = solution(31:32);
lagrange(:,i+1) = solution(33:end);
fvalnorm(i) = norm(fval(:,i));
if exitflag(i) < 1
    break;
end
end



function solution = ID(unknowns, q, v, i, dt, l, L, r, rdd, m1, m2)
Q = unknowns(1:15);
V = unknowns(16:30);
U = unknowns(31:32);
lagrange = unknowns(33:end);
u = [U(1);U(2)];


J = 9.5e-5;
g = 9.81;
Mp = diag([m1,m1,J,m1,m1,J,m1,m1,J,m1,m1,J,m2]);
Mr = diag([m2,m2]);
M = diag([m1,m1,J,m1,m1,J,m1,m1,J,m1,m1,J,m2,m2,m2]);

%Macierz sygnałów sterujących:
Bp = zeros(13,2);
Bp(3,1) = 1;
Bp(12,2) = 1;
Br = zeros(2,2);
B = [Bp;Br];

%Siły przyłożone do mechanizmu:
fp = [zeros(12,1);-m2*g];
fr = [0;0];
f = [fp;fr];

%Tłumienie w układzie:
dp = zeros(13,1);
dr = zeros(2,1);
d = [dp;dr];

%Macierze do projekcji na podprzestrzenie:
C = Phiq(Q,l);
S = [
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0]
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]    
];
Cr = S*C';
D = null([S;C]);






% H = Dp'*Mp*(V-v(:,i))/dt + Dp'*(dp - fp) + Dp'*Bp*u;
% s = rdd(:,i+1) - inv(Mr)*fr + inv(Mr)*Cr*lagrange;
% psi = C*[(V-v(:,i))/dt;rdd(:,i+1)];
% c = psi+C*inv(M)*(d-f) + C*inv(M)*B*u +C*inv(M)*C'*lagrange;

solution =[
(Q-q(:,i))/dt - V;
Phi(Q,l,L);
% D'*(M*((V-v(:,i))/dt) + d - f -B*u + C'*lagrange);
% S*inv(M)*(M*((V-v(:,i))/dt) + d - f -B*u + C'*lagrange);
% C*inv(M)*(M*((V-v(:,i))/dt) + d - f -B*u + C'*lagrange);
(M*((V-v(:,i))/dt) + d - f -B*u + C'*lagrange)
r(:,i+1) - [Q(14); Q(15)];
];
end