
load('validSettingsX2Y2_initial_cond_traj_circ.mat')

b_hat_range = linspace(0,5,100);
omega_c_range = linspace(-5,0,100);
x = zeros(1, 100);
y = zeros(1, 100);
z_IAE = zeros(1, 100000);
z_ISE = zeros(1, 100000);

z_ISE_matrix = zeros(100, 100);
z_IAE_matrix = zeros(100, 100);


for i=1:10000
    z_ISE(i) = validSettings(i).ISE;
    z_IAE(i) = validSettings(i).IAE;
end


for i =1:100
    z_ISE_matrix(:,i) = z_ISE(1 + (i-1)*100: i*100);
    z_IAE_matrix(:,i) = z_IAE(1 + (i-1)*100: i*100);
    x(i) = 10^b_hat_range(i);
    y(i) = 10^omega_c_range(i);
end

folder = 'C:\Users\janek\Desktop\Publikacja\Wykresy';


[min_val, ind] = min(z_IAE_matrix(:));
min_val_IAE = min_val
[row_IAE, col_IAE] = ind2sub(size(z_IAE_matrix), ind); 
b_hat_IAE = x(col_IAE)
omega_c_IAE = y(row_IAE)

% Rysowanie wykresu
figure()
surf(x, y, z_IAE_matrix)
xlabel('$\hat{b}$', 'Interpreter', 'latex', 'FontSize',16); 
ylabel('$\omega_c$', 'Interpreter', 'latex', 'FontSize',16);
zlabel('IAE', 'Interpreter', 'latex', 'FontSize',16);
title('$IAE(\omega_c, \hat{b})$', 'Interpreter', 'latex', 'FontSize',16);
filename='X2Y2_IAE_initial_cond.pdf';

set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');

% Pobieranie i modyfikacja mapy parula
new_colormap = parula;
new_colormap(1,:) = [0.8 0.8 1]; % Jasny niebieski dla najniższych wartości
colormap(new_colormap);
colorbar;
hold on;
plot3(x(col_IAE), y(row_IAE), min_val, 'rx', 'MarkerSize', 10, 'LineWidth', 5, 'MarkerFaceColor', 'r');

hold off;
fullfile_pdf = fullfile(folder, filename);
exportgraphics(gcf, fullfile_pdf)



[min_val, ind] = min(z_ISE_matrix(:));
min_val_ISE = min_val
[row_ISE, col_ISE] = ind2sub(size(z_ISE_matrix), ind); 

b_hat_ISE = x(col_ISE)
omega_c_ISE = y(row_ISE)

% Rysowanie wykresu
figure()
surf(x, y, z_ISE_matrix)
xlabel('$\hat{b}$', 'Interpreter', 'latex', 'FontSize',16); 
ylabel('$\omega_c$', 'Interpreter', 'latex', 'FontSize',16);
zlabel('ISE', 'Interpreter', 'latex', 'FontSize',16);
title('$ISE(\omega_c, \hat{b})$', 'Interpreter', 'latex', 'FontSize',16);
filename = 'X2Y2_ISE_initial_cond.pdf';

set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');

% Pobieranie i modyfikacja mapy parula
new_colormap = parula;
new_colormap(1,:) = [0.8 0.8 1]; % Jasny niebieski dla najniższych wartości
colormap(new_colormap);
colorbar;
hold on;
plot3(x(col_ISE), y(row_ISE), min_val, 'rx', 'MarkerSize', 10, 'LineWidth', 5, 'MarkerFaceColor', 'r');
hold off;
fullfile_pdf = fullfile(folder, filename);
exportgraphics(gcf, fullfile_pdf)

b_hat = 0.5*(b_hat_ISE+b_hat_IAE)
omega_c = 0.5*(omega_c_ISE + omega_c_IAE)