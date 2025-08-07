figure()
plot(t, uchyby_no_fb, t, uchyby_fb)
xlabel('$t[s]$', 'Interpreter', 'latex', 'FontSize',16); 
ylabel('$e[m]$', 'Interpreter', 'latex', 'FontSize',16);
zlabel('IAE', 'Interpreter', 'latex', 'FontSize',16);
title('$e(t)$', 'Interpreter', 'latex', 'FontSize',16);
grid on
legend('$e_x$ no Fb','$e_y$ no Fb','$e_x$','$e_y$', 'Interpreter', 'latex', 'FontSize',16, 'location', 'southwest')
filename='e(t).pdf';
fullfile_pdf = fullfile(folder, filename);
exportgraphics(gcf, fullfile_pdf);

