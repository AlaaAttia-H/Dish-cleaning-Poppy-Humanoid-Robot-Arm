syms q1 q2 q3 q4

JINV = inverseJacobianMatrix(q1, q2, q3, q4);
disp(JINV);

JacobianMat = jacobianmatrix();
disp(JacobianMat);

JacobianDer = jacobianDerivative();
disp(JacobianDer);

