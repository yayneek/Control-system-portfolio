clear; clc
syms q [1 13] real
syms v [1 13] real
syms a [1 13] real
syms p [1 2] real
syms pd [2 1] real
syms pdd [2 1] real
syms lagrange [1 11] real
syms l L u1 u2 m1 m2 J g real
syms x y f d
M = diag([m1,m1,J,m1,m1,J,m1,m1,J,m1,m1,J,m2,m2,m2]);
Mq = diag([m1,m1,J, m1,m1,J, m1,m1,J, m1,m1,J, m2]);

d = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
dp = zeros(13,1);
dq = zeros(2,1);

f = sym(zeros(15,1));
fp = sym(zeros(13,1));
f(13) = -g*m2;
fp(13) = -g*m2;
fq = zeros(2,1);


q = q';
v = v';
a = a';
p = p';
lagrange = lagrange';
u = [u1;u2];
B = zeros(15,2);
B(3,1) = 1;
B(12,2) = 1;
Bp = B(1:13,:);

Y = [q;p];
Yd = [v;pd];
Ydd = [a; pdd];

r = [l/2;0];
R = @(q)[cos(q) -sin(q); sin(q) cos(q)];





r1 = R(q(3))*r - [q(1) q(2)]'; 
r2 = 2*R(q(3))*r + R(q(6))*r -[q(4) q(5)]';
r3 = 2*R(q(3))*r + 2*R(q(6))*r + R(q(9))*r - [q(7); q(8)];
r4 = 2*R(q(3))*r + 2*R(q(6))*r + 2*R(q(9))*r + R(q(12))*r - [q(10); q(11)];
r5 = 2*R(q(3))*r + 2*R(q(6))*r + 2*R(q(9))*r + 2*R(q(12))*r - [2*l;0];
r6 = sqrt((l*cos(q(3)) + l*cos(q(6)) - p(1))^2 + (l*sin(q(3)) + l*sin(q(6)) - p(2))^2 + q(13)^2) - L;

Phi = [r1;r2;r3;r4;r5;r6];

C = jacobian(Phi, Y);
Psi = [p1;p2] - [x;y];
S = jacobian(Psi, Y);
Cr = S*C';
D = null([S;C]);
Dp = D(1:13,:);

gamma = -jacobian(C*Yd, Y)*Yd