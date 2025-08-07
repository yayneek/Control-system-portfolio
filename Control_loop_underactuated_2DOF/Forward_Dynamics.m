function [Q, V] = Forward_Dynamics(N, M, k, g, B, u, q, v, i, dt)
a = inv(M)*(g+B*u(:,i) -k);

if i < 5 || N==1
V = v(:,i) + dt * a;
Q = q(:,i) + dt * V; 
else
    if N == 2
        V = (2*dt*a - v(:, i-1) + 4 * v(:, i))/3;
        Q = (2*dt*V - q(:, i-1) + 4 * q(:, i))/3;
    elseif N == 3
        V = (6*dt*a + 2*v(:, i-2) - 9 * v(:, i-1) + 18 * v(:, i))/11;
        Q = (6*dt*V + 2*q(:, i-2) - 9 * q(:, i-1) + 18 * q(:, i))/11;
    elseif N == 4
        V = (12*dt*a - 3*v(:,i-3) + 16*v(:,i-2) - 36*v(:, i-1) +48*v(:,i))/25;
        Q = (12*dt*V - 3*q(:,i-3) + 16*q(:,i-2) - 36*q(:, i-1) +48*q(:,i))/25;
    elseif N == 5
        V = (60*dt*a + 12*v(:,i-4) - 75*v(:,i-3) + 200*v(:,i-2) - 300*v(:,i-1) + 300*v(:,i))/137;
        Q = (60*dt*V + 12*q(:,i-4) - 75*q(:,i-3) + 200*q(:,i-2) - 300*q(:,i-1) + 300*q(:,i))/137;
    else
        error('Wrong BDF order')
    end
end
end
