function qdot = inverseVelocityKinematics()

Jinv = Velocity_Inverse_Jacobian();
VFK = forwardVelocityKinematic();
qdot = Jinv * VFK;

end