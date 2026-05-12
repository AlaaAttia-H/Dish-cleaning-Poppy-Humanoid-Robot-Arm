function T = TranformationFunc(theta_i, d_i, a_i, alpha_i)
sym theta_i;
T = [cos(theta_i) -sin(theta_i)*round(cos(alpha_i)) sin(theta_i)*round(sin(alpha_i)) a_i*cos(theta_i);
     sin(theta_i) cos(theta_i)*round(cos(alpha_i)) -cos(theta_i)*round(sin(alpha_i)) a_i*sin(theta_i);
          0 round(sin(alpha_i)) round(cos(alpha_i)) d_i;
          0 0 0 1];