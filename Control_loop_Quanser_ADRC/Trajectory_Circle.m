function [q, qd, qdd] = Trajectory_Circle(t0,dt,tk, P0, r, n)
t = t0:dt:tk;
theta = Trajectory_Trapz(t0,dt,tk,3/2*pi, n*2*pi+3/2*pi, tk);
for i =1:length(t)
    x(i) = cos(theta(i))*r + P0(1);
    y(i) = sin(theta(i))*r + P0(2) + r;
end
xd = gradient(x)./gradient(t);
yd = gradient(y)./gradient(t);
xdd = gradient(xd)./gradient(t);
ydd = gradient(yd)./gradient(t);
q = [x;y];
qd = [xd;yd];
qdd = [xdd;ydd];
end

