function Solution = Inverse_Dynamics_v2(unknowns, M, g, k, B, y, ydd, q, v, i, dt, N)
f = length(M);
m = rank(B);
%k = f - m;

Q = [unknowns(1:f)];
V = [unknowns(f+1 : 2*f)];
u = unknowns(2*f+1 : 2*f+m);

%Trajektoria zadana:
kappa = 1/3;
phi = (1 - kappa)*Q(1) + kappa*Q(2) - y(:,i);
H = [1-kappa, kappa];
Hd = [0, 0];
h = Hd * V;

if(H(2) == 0)
    G = [0 1]';
elseif(H(1) == 0 && H(2) == 1)
    G = [1, 0]';
else
    G = [1, (-H(2)^(-1) * H(1))]';  
end

% %Masa na sprężynie na wózku 
% alfa = deg2rad(0);
% phi = Q(1) + Q(2)*cos(alfa) - y(:,i);
% H = [1, cos(alfa)];
% G = [cos(alfa), -1]';



%Równania do rozwiązania:
    Solution = [(Q - q(:,i))/dt - V;
                G'*M * (V - v(:,i))/dt - G'*(g-k) - G'*B*u;
                H*inv(M) * (g-k) + H*inv(M)*B*u + h - ydd(:,i);
                phi];
if N == 2 && i > 2
    Solution = [(3*Q - 4 * q(:, i) + q(:,i-1))/(2*dt) - V;
                G'*M * (3*V - 4*v(:,i) + v(:,i-1))/(2*dt) - G'*(g-k) - G'*B*u;
                H*inv(M) * (g-k) + H*inv(M)*B*u + h - ydd(:,i);
                phi];
elseif N == 3 && i > 3
    Solution = [(11*Q - 18*q(:,i) + 9*q(:,i-1) -2*q(:,i-2))/(6*dt) - V;
                G'*M * (11*V - 18*v(:,i) + 9*v(:,i-1) - 2*v(:,i-2))/(6*dt) - G'*(g-k) - G'*B*u;
                H*inv(M) * (g-k) + H*inv(M)*B*u + h - ydd(:,i);
                phi];
elseif N == 4 && i > 4
    Solution = [(25*Q - 48*q(:,i) + 36*q(:,i-1) - 16*q(:,i-2) + 3*q(:,i-3))/(12*dt) - V;
                G'*M * (25*V - 48*v(:,i) + 36*v(:,i-1) - 16*v(:,i-2) + 3*v(:,i-3))/(12*dt) - G'*(g-k) - G'*B*u;
                H*inv(M) * (g-k) + H*inv(M)*B*u + h - ydd(:,i);
                phi];

elseif N == 5 && i > 5
    Solution =[(137*Q - 300*q(:,i) + 300*q(:,i-1) - 200*q(:,i-2) + 75*q(:,i-3) - 12*q(:,i-4))/(60*dt) - V;
                G'*M*(137*V - 300*v(:,i) + 300*v(:,i-1) - 200*v(:,i-2) + 75*v(:,i-3) - 12*v(:,i-4))/(60*dt) - G'*(g-k) - G'*B*u;
                H*inv(M) * (g-k) + H*inv(M)*B*u + h - ydd(:,i);
                phi];
end

end
