function [P1, P2, P] = Points_On_Plane(q, l1 , l2)
r1 = [l1; 0];
r2 = [l2; 0];
P1 = zeros(2, length(q));
P2 = zeros(2, length(q));
for i = 1:length(q)
    R1 = [cos(q(1,i)) -sin(q(1,i)); sin(q(1,i)) cos(q(1,i))];
    R2 = [cos(q(2,i)) -sin(q(2,i)); sin(q(2,i)) cos(q(2,i))];
    P1(:,i) = R1*r1;
    P2(:,i) = R1*r1+R2*r2;
    P(:,i) = R1*r1+R2*r2/2; 
end
end