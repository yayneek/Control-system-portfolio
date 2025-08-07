function Animacja(q, l, t, dt, traj)
%punkty na plaszczyznie:
P1 = zeros(2,length(t));
P2 = zeros(2,length(t));
P3 = zeros(2,length(t));
P4 = zeros(2,length(t));
P5 = zeros(2,length(t));
R = @(q)[cos(q) -sin(q); sin(q) cos(q)];
r = [l;0];

for i =1:length(t)
    P1(:,i) = [0;0];
    P2(:,i) = R(q(3,i))*r;
    P3(:,i) = R(q(3,i))*r + R(q(6,i))*r;
    P4(:,i) = R(q(3,i))*r + R(q(6,i))*r + R(q(9,i))*r;
    P5(:,i) = R(q(3,i))*r + R(q(6,i))*r + R(q(9,i))*r + R(q(12,i))*r;
end

%Animacja:
% Inicjalizacja wykresu
close all
figure;
axis equal;
grid on;
title('Quanser 2DOF robot');
xlabel('X[m]');
ylabel('Y[m]');
xlim([-3/2*l; 3.5*l])
ylim([-2*l; 2*l])

xticks(-2*l:l:4*l);
yticks(-2*l:l:2*l);

xticklabels(arrayfun(@(x) [num2str(x) '*l'], -2:4, 'UniformOutput', false));
yticklabels(arrayfun(@(y) [num2str(y) '*l'], -2:2, 'UniformOutput', false));


% Animacja mechanizmu
for i = 1:length(t)
    cla; % Wyczyszczenie aktualnych osi przed rysowaniem nowego położenia
    hold on;
    
    % Rysowanie punktów
    plot([P1(1,i), P2(1,i), P3(1,i), P4(1,i), P5(1,i)], [P1(2,i), P2(2,i), P3(2,i), P4(2,i), P5(2,i)], 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
         
         
     
    % Rysowanie linii łączących punkty
    plot([P1(1,i), P2(1,i)], [P1(2,i), P2(2,i)], 'b-', 'LineWidth', 2);
    plot([P2(1,i), P3(1,i)], [P2(2,i), P3(2,i)], 'b-', 'LineWidth', 2);
    plot([P3(1,i), P4(1,i)], [P3(2,i), P4(2,i)], 'b-', 'LineWidth', 2);
    plot([P4(1,i), P5(1,i)], [P4(2,i), P5(2,i)], 'b-', 'LineWidth', 2);
    plot(l*cos(1:0.01:100)+l, 2*l*sqrt(3)/2*sin(1:0.01:100))
    plot(2*l*cos(1:0.01:100), 2*l*sin(1:0.01:100))
    plot(2*l*cos(1:0.01:100)+2*l, 2*l*sin(1:0.01:100))

    text(-1.4*l, 1.8*l, ['Czas: ' num2str(t(i), '%.2f') ' s'], 'FontSize', 12, 'Color', 'k');

    %Rysowanie trajektorii:
    plot(traj(1,:), traj(2,:), 'g--', 'LineWidth', 1.5); % Dodatkowa trajektoria
    plot(P3(1,1:i), P3(2,1:i), 'm--', 'LineWidth', 1.5); % Trajektoria punktu P3
  
    
    
    legend('','','','','','','Trajektoria zadana','Trajektoria zrealizowana')
    hold off;
    % Pauza dla efektu animacji
    pause(dt/10);
end
end

