clear; clc
syms l q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 p1 p2 L 

wiezy =[

 
                                                                 (l*cos(q3))/2 - q1;
                                                                 (l*sin(q3))/2 - q2;
                                                     l*cos(q3) - q4 + (l*cos(q6))/2;
                                                     l*sin(q3) - q5 + (l*sin(q6))/2;
                                         l*cos(q3) - q7 + l*cos(q6) + (l*cos(q9))/2;
                                         l*sin(q3) - q8 + l*sin(q6) + (l*sin(q9))/2;
                           l*cos(q3) - q10 + l*cos(q6) + l*cos(q9) + (l*cos(q12))/2;
                           l*sin(q3) - q11 + l*sin(q6) + l*sin(q9) + (l*sin(q12))/2;
                               l*cos(q3) - 2*l + l*cos(q6) + l*cos(q9) + l*cos(q12);
                                     l*sin(q3) + l*sin(q6) + l*sin(q9) + l*sin(q12);
((l*cos(q3) - p1 + l*cos(q6))^2 + q13^2 + (l*sin(q3) - p2 + l*sin(q6))^2)^(1/2) - L;
];
q = [q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 p1 p2]; 

servo = [p1; p2];
S = jacobian(servo, q);

C = jacobian(wiezy, q);
size(C)

size([S;C])

D = null([S' C']');
size(D);