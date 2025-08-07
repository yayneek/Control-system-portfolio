function wiezy = Phi(q,l,L)
q1 = q(1);
q2 = q(2);
q3 = q(3);
q4 = q(4);
q5 = q(5);
q6 = q(6);
q7 = q(7);
q8 = q(8);
q9 = q(9);
q10 = q(10);
q11 = q(11);
q12 = q(12);
q13 = q(13);
p1 = q(14);
p2 = q(15);

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
 
                                                                
end

