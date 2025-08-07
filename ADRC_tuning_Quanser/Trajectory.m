function [y, yd, ydd] = Trajectory(t0, dt, tk, starting_point, rest_point, setting_time)

time = t0:dt:tk;
time2 = t0:dt:setting_time;

y_poly = starting_point + (rest_point - starting_point)*((126*time2.^5)/setting_time^5 - (420*time2.^6)/setting_time^6 + (540*time2.^7)/setting_time.^7 - (315*time2.^8)/setting_time^8 + (70*time2.^9)/setting_time^9);
yd_poly = (rest_point - starting_point)*((630*time2.^4)/setting_time^5 - (2520*time2.^5)/setting_time^6 + (3780*time2.^6)/setting_time^7 - (2520*time2.^7)/setting_time^8 + (630*time2.^8)/setting_time^9);
ydd_poly = (rest_point - starting_point)*((2520*time2.^3)/setting_time^5 - (12600*time2.^4)/setting_time^6 + (22680*time2.^5)/setting_time^7 - (17640*time2.^6)/setting_time^8 + (5040*time2.^7)/setting_time^9);

y = [y_poly, ones(1, length(time)-length(time2))*(rest_point - starting_point) + starting_point];
yd = [yd_poly, zeros(1, length(time)-length(time2))];
ydd = [ydd_poly, zeros(1,length(time)-length(time2))];

end