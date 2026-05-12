function j = jacobianMatrix()

syms q1 q2 q3 q4 

T01 = Tranformationfunc(-(pi/2)+q1, 27, 0, (-pi/2));
T12 = Tranformationfunc(q2, 0, 0,  pi/2);
T23 = Tranformationfunc(-(pi/2)+q3, 185, 0, (-pi/2));
T34 = Tranformationfunc(-(pi/2)+q4, 0, 150, 0);

T02 = T01 * T12;
T03 = T01 * T12 * T23;
T04 = T01 * T12 * T23 * T34; 

Z00 = [0; 0; 1];
O00 = [0; 0; 0];

Z01 = [T01(1,3); T01(2,3); T01(3,3)]; 
O01 = [T01(1,4); T01(2,4); T01(3,4)]; 

Z02 = [T02(1,3); T02(2,3); T02(3,3)]; 
O02 = [T02(1,4); T02(2,4); T02(3,4)]; 

Z03 = [T03(1,3); T03(2,3); T03(3,3)]; 
O03 = [T03(1,4); T03(2,4); T03(3,4)]; 

O04 = [T04(1,4); T04(2,4); T04(3,4)]; 

Jv1 = cross(Z00, (O04 - O00));
Jw1 = Z00;
Jv2 = cross(Z01, (O04 - O01));
Jw2 = Z01;
Jv3 = cross(Z02, (O04 - O02));
Jw3 = Z02;
Jv4 = cross(Z03, (O04 - O03));
Jw4 = Z03;

j = [Jv1 Jv2 Jv3 Jv4; Jw1 Jw2 Jw3 Jw4];

end