function Jdot = jacobianDerivative()

syms q1 q2 q3 q4 q1dot q2dot q3dot q4dot

J = jacobianmatrix();
J1 = diff(J,q1)*q1dot;
J2 = diff(J,q2)*q2dot;
J3 = diff(J,q3)*q3dot;
J4 = diff(J,q4)*q4dot;

Jdot = J1 + J2 + J3 + J4;

end
