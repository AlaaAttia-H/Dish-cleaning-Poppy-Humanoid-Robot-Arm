function qdd = inverseAccelerationKinematics()

syms q1dd q2dd q3dd q4dd

Jinv = Velocity_Inverse_Jacobian();
AF = forward_acceleration_kinematics();
J_dot = jacobian_derivative();

qdd = Jinv * (AF - J_dot * [q1dd; q2dd; q3dd; q4dd]);

end