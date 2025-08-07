function [q, qd, qdd] = Quanser_Trajectory(t0, dt, tk, P0, Pk, setting_time)
time = t0:dt:tk;

%Punkty:

P2 = zeros(2, length(time));
P3 = zeros(2, length(time));
P4 = zeros(2, length(time));

q1 = zeros(1, length(time));
q2 = zeros(1, length(time));

%Położenie początkowe:
l = 1;
P2(:,1) = [0; -l];
P4(:,1) = [l; 0];
q0 = [3/2*pi; pi];
initial_guess_inverse = [P2(:,1)', P4(:,1)', q0'];

%Trajektoria dla efektora:
X = Trajectory(t0, dt, tk, P0(1), Pk(1), setting_time);
Y = Trajectory(t0, dt, tk, P0(2), Pk(2), setting_time);

%Sprawdzenie, czy trajektoria znajduje się w przestrzeni roboczej, która jest elipsą:
a = 2*l;
b = (2*l*sqrt(3))/2;
for i=1:length(time)
    if( (X(i)-l)^2/a^2 + Y(i)^2/b^2 > 1)
        disp(i)
        error('Zadana trajektoria znajduje się poza przestrzenią roboczą')
    end

end

%Rozwiązanie iteracyjne:
options = optimset('Display','off', 'TolFun', 1e-6, 'TolX', 1e-6, 'MaxIter', 1000, 'MaxFunEvals', 5000,'Algorithm', 'levenberg-marquardt');

for i=1:length(time)
    
    func = @(alfa)Phi_Inverse([X(i), Y(i)], alfa, l);
    solution= fsolve(func, initial_guess_inverse, options);
    initial_guess_inverse = solution;
    
    P2(:,i) = [solution(1); solution(2)];
    P4(:,i) = [solution(3); solution(4)];
    q1(i) = solution(5);
    q2(i) = solution(6);
end

q = [q1; q2];
qd = gradient(q)./gradient(time);
qdd = gradient(qd)./gradient(time);


function [y, yd, ydd] = Trajectory(t0, dt, tk, starting_point, rest_point, setting_time)

t = t0:dt:tk;
time2 = t0:dt:setting_time;

y_poly = starting_point + (rest_point - starting_point)*((126*time2.^5)/setting_time^5 - (420*time2.^6)/setting_time^6 + (540*time2.^7)/setting_time.^7 - (315*time2.^8)/setting_time^8 + (70*time2.^9)/setting_time^9);
yd_poly = (rest_point - starting_point)*((630*time2.^4)/setting_time^5 - (2520*time2.^5)/setting_time^6 + (3780*time2.^6)/setting_time^7 - (2520*time2.^7)/setting_time^8 + (630*time2.^8)/setting_time^9);
ydd_poly = (rest_point - starting_point)*((2520*time2.^3)/setting_time^5 - (12600*time2.^4)/setting_time^6 + (22680*time2.^5)/setting_time^7 - (17640*time2.^6)/setting_time^8 + (5040*time2.^7)/setting_time^9);

y = [y_poly, ones(1, length(t)-length(time2))*(rest_point - starting_point) + starting_point];
yd = [yd_poly, zeros(1, length(t)-length(time2))];
ydd = [ydd_poly, zeros(1,length(t)-length(time2))];

end

function solution = Phi_Inverse(dane, szukane, l)
solution = [
    szukane(1) - l*cos(szukane(5));
    szukane(2) - l*sin(szukane(5));
    (szukane(1) - dane(1))^2 + (szukane(2) - dane(2))^2 - l^2;
    (szukane(3) - dane(1))^2 + (szukane(4) - dane(2))^2 - l^2;
    szukane(3) - l*cos(szukane(6)) - 2* l;
    szukane(4) - l*sin(szukane(6));
    ];
end
end

