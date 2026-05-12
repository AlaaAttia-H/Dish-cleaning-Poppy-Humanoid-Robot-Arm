function q = inverseKinematicsFunc(q0, X)
syms q1 q2 q3 q4
JINV = inverse_jacobian_matrix(q1, q2, q3, q4);
q = q0;
q1 = q0(1);
q2 = q0(2);
q3 = q0(3);
q4 = q0(4);

xee = 185*sin((pi*q2)/180)*cos((pi*(q1 - 90))/180)...
    - 150*cos((pi*(q4 - 90))/180)...
    *(sin((pi*(q1 - 90))/180)*sin((pi*(q3 - 90))/180)...
    - cos((pi*q2)/180)*cos((pi*(q1 - 90))/180)*...
    cos((pi*(q3 - 90))/180)) - ...
    150*sin((pi*q2)/180)*cos((pi*(q1 - 90))/180)*sin((pi*(q4 - 90))/180);
 
 
yee = 150*cos((pi*(q4 - 90))/180)*...
    (cos((pi*(q1 - 90))/180)*sin((pi*(q3 - 90))/180)...
    + cos((pi*q2)/180)*cos((pi*(q3 - 90))/180)*sin((pi*(q1 - 90))/180))...
    + 185*sin((pi*q2)/180)*sin((pi*(q1 - 90))/180)...
    - 150*sin((pi*q2)/180)*sin((pi*(q1 - 90))/180)*sin((pi*(q4 - 90))/180);
 
 
zee = 185*cos((pi*q2)/180)...
    - 150*cos((pi*q2)/180)*sin((pi*(q4 - 90))/180)...
    - 150*sin((pi*q2)/180)*cos((pi*(q3 - 90))/180)...
    *cos((pi*(q4 - 90))/180) + 27;

n = 0;

while n < 50

J = subs(JINV, [q1; q2; q3; q4], q0);
Jinv = feval(J);

x = subs(xee, [q1; q2; q3; q4], q0);
y = subs(yee, [q1; q2; q3; q4], q0);
z = subs(zee, [q1; q2; q3; q4], q0);

q = q0 - Jinv * [x-X(1); y-X(2); z-X(3)];

q = subs(q, [q1; q2; q3; q4], q0);
q = eval(q);

if q(1) - q0(1) <= 1 &&  q(2) - q0(2) <= 1 && ...
        q(3) - q0(3) <= 1 &&  q(4) - q0(4) <= 1

q0 = q;

n = n + 1;
end

end