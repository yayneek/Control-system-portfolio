function [y, yd, ydd, yd3, yd4] = Trajectory_v2(t0, dt, tk, starting_point, rest_point, setting_time)
syms t
time  =t0:dt:tk;
time2 = t0:dt:setting_time;
tau = setting_time - t0;

Y = starting_point + (126 * (t/tau)^5 - 420*(t/tau)^6 + 540*(t/tau)^7 - 315*(t/tau)^8 + 70 * (t/tau)^9)*(rest_point - starting_point);
Yd = diff(Y);
Ydd = diff(Yd);
Yd3 = diff(Ydd);
Yd4 = diff(Yd3);

y_poly = double(subs(Y, t, time2));
yd_poly = double(subs(Yd, t, time2));
ydd_poly = double(subs(Ydd, t, time2));
yd3_poly = double(subs(Yd3, t, time2));
yd4_poly = double(subs(Yd4, t, time2));

y = [y_poly, starting_point + ones(1, length(time) - length(time2)) * (rest_point - starting_point)];
yd = [yd_poly, zeros(1, length(time) - length(time2))];
ydd = [ydd_poly, zeros(1, length(time) - length(time2))];
yd3 = [yd3_poly, zeros(1, length(time) - length(time2))];
yd4 = [yd4_poly, zeros(1, length(time) - length(time2))];

end

