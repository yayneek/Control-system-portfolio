uchyby = out.error.data';
wspolrzedne = out.coordinates.data;
traj = out.trajectory.data;
u_fb = out.u_fb.data';

q = zeros(15,length(t));
lag = zeros(11,length(t));
ex = zeros(1,length(t));
ey = zeros(1,length(t));
maksimum = 0;
for i =1:length(t)
    q(:,i) = wspolrzedne(:,1,i);
    lag(:,i) = out.lagrange.data(:,1,i);
    ex(i) = uchyby(1,i);
    ey(i) = uchyby(2,i);
end

%%
Animacja3d(q,l,L,t,dt,r)
    
%%
figure()
plot(t, q(14,:), t, q(15,:))
title('X, Y ładunku ')
grid on

figure()
plot(t, lagrange(11,:))
title('Napięcie w linie')
grid on

%% WYKRESY
folder = 'C:\Users\janek\Desktop\Publikacja\Wykresy';


% figure()
% plot(t, ex, t, ey, t, ex_nofb, t, ey_nofb)
% title('$e(t)$','Interpreter','latex', 'FontSize',16)
% grid on
% legend('$e_x$','$e_y$','$e_x$ no feedback','$e_y$ no feedback','Interpreter','latex', 'FontSize',16, 'location','northwest')
% ylabel('$e[m]$','Interpreter','latex', 'FontSize',16)
% xlabel('$t[s]$','Interpreter','latex', 'FontSize',16)

% filename = 'e(t)_ADRC';
% fullfile_pdf = fullfile(folder, [append(filename, Case) '.pdf']);
% exportgraphics(gcf, fullfile_pdf);

figure()
plot(t, u)
title('$u_{ffw}(t)$','Interpreter','latex', 'FontSize',16)
grid on
legend('$u_1$','$u_2$','Interpreter','latex', 'FontSize',16, 'location','southwest')
ylabel('$u[Nm]$','Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$','Interpreter','latex', 'FontSize',16)

filename = 'uffw(t)_ADRC.pdf';
fullfile_pdf = fullfile(folder, filename);
exportgraphics(gcf, fullfile_pdf);

figure()
plot(t, u+u_fb)
title('$u_{ffw}(t) + u_{fb}(t)$','Interpreter','latex', 'FontSize',16)
grid on
legend('$u_1$','$u_2$','Interpreter','latex', 'FontSize',16, 'location','southwest')
ylabel('$u[Nm]$','Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$','Interpreter','latex', 'FontSize',16)

filename = 'uffw+ufb(t)_ADRC.pdf';
fullfile_pdf = fullfile(folder, filename);
exportgraphics(gcf, fullfile_pdf);


figure()
plot(t, u_fb)
title('$u_{fb}(t)$','Interpreter','latex', 'FontSize',16)
grid on
legend('$u_1$','$u_2$','Interpreter','latex', 'FontSize',16, 'location','southwest')
ylabel('$u[Nm]$','Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$','Interpreter','latex', 'FontSize',16)
filename = 'ufb(t)_ADRC.pdf';
fullfile_pdf = fullfile(folder, filename);
exportgraphics(gcf, fullfile_pdf);

figure()
plot(t, u_fb(1,:))
title('$u_{fb1}(t)$','Interpreter','latex', 'FontSize',16)
grid on
ylabel('$u[Nm]$','Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$','Interpreter','latex', 'FontSize',16)
% filename = 'ufb1(t)_ADRC';
% fullfile_pdf = fullfile(folder, [append(filename, Case) '.pdf']);
% exportgraphics(gcf, fullfile_pdf);

figure()
plot(t, u_fb(2,:))
title('$u_{fb2}(t)$','Interpreter','latex', 'FontSize',16)
grid on
ylabel('$u[Nm]$','Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$','Interpreter','latex', 'FontSize',16)
% filename = 'ufb2(t)_ADRC';
% fullfile_pdf = fullfile(folder, [append(filename, Case) '.pdf']);
% exportgraphics(gcf, fullfile_pdf);

%% 

folder = 'C:\Users\janek\Desktop\Quanser\Underactuated\Wykresy_2\Load_up';
Case = 'circ';

figure()
plot(t, u)
title('$u_{ffw}(t)$','Interpreter','latex', 'FontSize',16)
grid on
legend('$u_1$','$u_2$','Interpreter','latex', 'FontSize',16, 'location','southwest')
ylabel('$u[Nm]$','Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$','Interpreter','latex', 'FontSize',16)
filename = 'uffw(t)';
fullfile_pdf = fullfile(folder, [append(filename, Case) '.pdf']);
exportgraphics(gcf, fullfile_pdf);

figure()
plot(t, q(13,:))
title('$z(t)$','Interpreter','latex', 'FontSize',16)
xlabel('$t[s]$','Interpreter','latex', 'FontSize',16)
ylabel('$z[m]$','Interpreter','latex', 'FontSize',16)
grid on
filename = 'z(t)';
fullfile_pdf = fullfile(folder, [append(filename, Case) '.pdf']);
exportgraphics(gcf, fullfile_pdf);

Animacja3d([q;r], l, L, t, dt, r);