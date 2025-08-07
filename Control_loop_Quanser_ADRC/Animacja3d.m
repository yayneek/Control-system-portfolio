function Animacja3d(q, l, L, t, dt, traj)
    %punkty w przestrzeni 3D:
    P1 = zeros(3, length(t));
    P2 = zeros(3, length(t));
    P3 = zeros(3, length(t));
    P4 = zeros(3, length(t));
    P5 = zeros(3, length(t));
    P6 = zeros(3, length(t));
    R = @(q)[cos(q) -sin(q); sin(q) cos(q)];
    r = [l; 0];

    animacja = VideoWriter('Quanser_actuated_animation.mp4','MPEG-4');
    open(animacja);

    for i = 1:length(t)
        P1(:,i) = [0; 0; 0];
        P2(1:2,i) = R(q(3,i)) * r;
        P3(1:2,i) = R(q(3,i)) * r + R(q(6,i)) * r;
        P4(1:2,i) = R(q(3,i)) * r + R(q(6,i)) * r + R(q(9,i)) * r;
        P5(1:2,i) = R(q(3,i)) * r + R(q(6,i)) * r + R(q(9,i)) * r + R(q(12,i)) * r;
        P6(1:3,i) = [q(14,i);q(15,i);q(13,i)];
        P6(3,i) = q(13,i);
    end
   
    %Animacja:
    
    % Inicjalizacja wykresu
    close all;
    figure;
    grid on;

    %Trajektoria ładunku:
    plot3(q(14,:), q(15,:), q(13,:));
    grid on
    axis equal;
    xticks(-2*l:l:4*l);
    yticks(-2*l:l:4*l);
    zticks(-L:L:L);
    xticklabels(arrayfun(@(x) [num2str(x) '*l'], -2:4, 'UniformOutput', false));
    yticklabels(arrayfun(@(y) [num2str(y) '*l'], -2:2, 'UniformOutput', false));
    zticklabels(arrayfun(@(z) [num2str(z) '*L'], -1:1, 'UniformOutput', false));
    title('Quanser 2DOF robot with load');
    xlabel('X[m]');
    ylabel('Y[m]');
    zlabel('Z[m]');
    xlim([-1*l, 2.5*l]);
    ylim([-2*l, 1*l]);
    zlim([-L, L]);


    % Animacja mechanizmu
    for i = 1:length(t)

        cla; % Wyczyszczenie aktualnych osi przed rysowaniem nowego położenia
        hold on;

        % Rysowanie punktów
        plot3([P1(1,i), P2(1,i), P3(1,i), P4(1,i), P5(1,i)], ...
              [P1(2,i), P2(2,i), P3(2,i), P4(2,i), P5(2,i)], ...
              [P1(3,i), P2(3,i), P3(3,i), P4(3,i), P5(3,i)], ...
              'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');
        plot3(P6(1,i), P6(2,i), q(13,i), 'ro', 'MarkerSize',10,'MarkerFaceColor','black','MarkerEdgeColor','black')

        % Rysowanie linii łączących punkty
        plot3([P1(1,i), P2(1,i)], [P1(2,i), P2(2,i)], [P1(3,i), P2(3,i)], 'b-', 'LineWidth', 2);
        plot3([P2(1,i), P3(1,i)], [P2(2,i), P3(2,i)], [P2(3,i), P3(3,i)], 'b-', 'LineWidth', 2);
        plot3([P3(1,i), P4(1,i)], [P3(2,i), P4(2,i)], [P3(3,i), P4(3,i)], 'b-', 'LineWidth', 2);
        plot3([P4(1,i), P5(1,i)], [P4(2,i), P5(2,i)], [P4(3,i), P5(3,i)], 'b-', 'LineWidth', 2);

        %Lina łącząca punkt charakterystyczny z ładunkiem:
        plot3([P3(1,i), P6(1,i)], [P3(2,i), P6(2,i)], [P3(3,i), P6(3,i)], 'g-', 'LineWidth', 2);
        % Dodanie trajektorii:
        plot3(traj(1,:), traj(2,:), q(13,:), 'g--', 'LineWidth', 1.5); % Dodatkowa trajektoria
        plot3(P3(1,1:i), P3(2,1:i), P3(3,1:i), 'm--', 'LineWidth', 1.5); % Trajektoria punktu P3

        text(-1*l, 2.3*l, 1.2*L, ['Time: ' num2str(t(i), '%.2f') ' s'], 'FontSize', 12, 'Color', 'k');

        %legend('','','','','','','Trajektoria zadana','Trajektoria zrealizowana');
        hold off;
        % Pauza dla efektu animacji
        pause(dt);
        frame = getframe(gcf);
        writeVideo(animacja, frame);



    end
    close(animacja);
end