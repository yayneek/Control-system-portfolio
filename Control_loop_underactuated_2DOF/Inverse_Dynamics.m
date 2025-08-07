function Solution = Inverse_Dynamics(unknowns, M,f,d,B,y,ydd,q,v,i,dt,N)
n = length(M);
m = rank(B);
k = n-m;

Q = [unknowns(1:n)];
V = [unknowns(n+1:2*n)];
u = [unknowns(2*n+1: 2*n+m)];

%Zadana trajektoria:
kappa = 0.33;
c = (1-kappa)*Q(1) + kappa* Q(2) - y(i);
C = [1-kappa, kappa];
Cd = [0,0];
psi = ydd(:,i) - Cd*V;
if C(2) ==0
    D = [0, 1]';
else
    D = [1, (-C(2)^(-1) * C(1))]';  
end


Solution = [(Q-q(:,i))/dt - V; 
    D'*M*(V-v(:,i))/dt - D'*(f-d) - D'*B*u; 
    C/(M)*(f-d) - C/M*B*u - psi;
    c];

if N ==2 && i>2
    Solution= [ (3*Q - 4 * q(:,i) + q(:,i-1))/(2*dt) - V;
                D'*M*(3*V - 4 * v(:,i) + q(:,i-1))/(2*dt) - D'*(f-d) - D'*B*u;
                C/M*(f-d) - C/M*B*u - psi;
                c];
elseif N == 3 && i > 3
    Solution = [(11*Q - 18 * q(:,i) + 9 * q(:,i-1) - 2*q(:,i-2))/(6*dt) - V;
                D'*M*(11*V - 18 * v(:,i) + 9 * v(:,i-1) - 2*v(:,i-2))/(6*dt) - D'*(f-d) - D'*B*u;
                C/M*(f-d) - C/M*B*u - psi;
                c];
elseif N == 4 && i > 4
    Solution = [(25*Q - 48*q(:,i) + 36*q(:,i-1) - 16*q(:,i-2) + 3*q(:,i-3))/(12*dt) - V;
                D'*M*(25*V - 48*v(:,i) + 36*v(:,i-1) - 16*v(:,i-2) + 3*v(:,i-3))/(12*dt) - D'*(f-d) - D'*B*u;
                C/M*(f-d) - C/M*B*u - psi;
                c];
elseif N == 5 && i > 5
    Solution=   [(137*Q - 300*q(:,i) + 300*q(:,i-1) - 200*q(:,i-2) + 75*q(:,i-3) - 12*q(:,i-4))/(60*dt) - V;
                D'*M*(137*V - 300*v(:,i) + 300*v(:,i-1) - 200*v(:,i-2) + 75*v(:,i-3) - 12*v(:,i-4))/(60*dt) - D'*(f-d) - D'*B*u;
                C/M*(f-d) - C/M*B*u - psi;
                c];
end