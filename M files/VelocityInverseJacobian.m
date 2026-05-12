function INVJ = VelocityInverseJacobian()

J = jacobianmatrix();
INVJ = pinv(J);

end