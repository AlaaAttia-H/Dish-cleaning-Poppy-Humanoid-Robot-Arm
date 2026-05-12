# Modeling and Control of Poppy Humanoid Robot Arm

## Overview

This project presents the modeling, simulation, fabrication, and control of a robotic arm inspired by the Poppy Humanoid robot. The main goal of the project was to design a service robotic arm capable of performing a household assistance task: washing dishes.

The project combines mechanical design, forward and inverse kinematics, trajectory planning, MATLAB/Simulink modeling, Simscape Multibody simulation, and hardware implementation using a 3D-printed robotic arm controlled by an Arduino Mega.

## Project Objectives

- Design a robotic arm inspired by the Poppy Humanoid robot.
- Design a lightweight 2-jaw gripper suitable for handling cleaning tools and dishes.
- Derive the forward kinematics of the robotic arm using the Denavit-Hartenberg convention.
- Implement forward and inverse kinematics using MATLAB.
- Validate the kinematic model using Simulink and Simscape Multibody.
- Plan task-space trajectories for a dish-washing motion.
- Fabricate the robotic arm using 3D printing.
- Implement the hardware system using servo motors and Arduino Mega.
- Compare the simulation results with the real hardware motion.

## Application

The robotic arm was designed as a service robotics application for home assistance. The target task was washing dishes, which can be difficult or tiring for elderly or disabled people.

The arm was planned to perform a sequence of actions such as:

- Moving toward the cleaning tool position
- Picking up the loofah using the gripper
- Moving toward the dish position
- Performing a washing motion
- Returning the loofah to its original position

## System Features

- Poppy Humanoid-inspired robotic arm design
- 3D-printed mechanical structure
- Lightweight 2-jaw gripper
- Servo motor-based actuation
- Arduino Mega-based control
- MATLAB forward kinematics
- MATLAB inverse kinematics
- Simulink validation
- Simscape Multibody simulation
- Straight-line task-space trajectory planning
- Visual comparison between simulation and hardware motion

## Technologies Used

- MATLAB
- Simulink
- Simscape Multibody
- SolidWorks
- Arduino Mega 2560 Rev3
- Servo motors
- 3D printing
- Forward kinematics
- Inverse kinematics
- Denavit-Hartenberg convention
- Newton-Raphson numerical method
- Trajectory planning

## Mechanical Design

The robotic arm design was inspired by the right arm of the Poppy Humanoid robot. The arm structure was designed in SolidWorks and fabricated using 3D printing.

The system consists of:

- Robotic arm links
- Servo motor joints
- 2-jaw gripper
- Fixed base
- Support pole
- U-bracket motor holder
- Power supply housing

The gripper was designed to be small and lightweight to avoid adding unnecessary load on the motors. It was intended to hold objects such as cleaning tools, dishes, and cloths.

## Gripper Design

The end effector is a 2-jaw gripper designed in SolidWorks. The gripper was designed to be lightweight while still strong enough to perform the required task.

The gripper was fabricated using 3D printing with 100% infill to improve its strength and durability.

## Hardware Components

| Component | Purpose |
|---|---|
| FR0109M Servo Motors | Main robotic arm joints |
| SG90 Servo Motor | Gripper actuation |
| Arduino Mega 2560 Rev3 | Microcontroller for motor control |
| 5V 20A Power Supply | Power source for servo motors |
| 3D-Printed PLA Structure | Robotic arm body and gripper |
| Wooden Base | Mechanical support |
| Steel Holder | Arm mounting support |
| Acrylic Housing | Power supply housing |

## Hardware Implementation

The robotic arm was fabricated using PLA filament with 100% infill because the arm contains structural parts that need to withstand mechanical stress.

The Arduino Mega 2560 Rev3 was used as the main microcontroller because it provides multiple PWM pins, which are needed to control the servo motors.

A 5V 20A power supply was used because each servo motor can require high current under stall conditions. The high-current supply ensured that all motors could be powered reliably during movement.

## Kinematic Modeling

The kinematic model was developed using the Denavit-Hartenberg convention. The coordinate axes were assigned to each joint, and the DH table was used to derive the homogeneous transformation matrices.

The arm was modeled as a multi-joint robotic system, where the end-effector position depends on the joint angles.

## Denavit-Hartenberg Parameters

| Joint `i` | `θi` | `di` | `ai` | `αi` |
|---|---|---:|---:|---:|
| 1 | `q1 - 90` | 27 | 0 | 90 |
| 2 | `q2 + 90` | 0 | 0 | 90 |
| 3 | `q3 - 90` | 140 | 0 | -90 |
| 4 | `q4 - 90` | 0 | 150 | 0 |

The transformation matrices were generated and multiplied using MATLAB to calculate the end-effector position.

## Forward Kinematics

The forward kinematics model calculates the end-effector coordinates from the motor joint angles.

The output position is represented as:

```text
Xee = f(q1, q2, q3, q4)
Yee = f(q1, q2, q3, q4)
Zee = f(q1, q2, q3, q4)
```

The full homogeneous transformation matrix was generated in MATLAB using a symbolic function.

## Inverse Kinematics

Inverse kinematics was implemented to calculate the required joint angles for a desired end-effector position.

A Newton-Raphson numerical method was used to approximate the motor angles. The method starts from an initial guess and iteratively updates the joint values until the difference between the actual and desired end-effector position becomes very small.

The inverse kinematics process used:

- Desired end-effector position
- Current joint angle estimate
- Jacobian inverse
- Iterative numerical updates
- Stopping criteria based on position error or singular behavior

## Validation

The forward and inverse kinematics functions were validated by connecting them together.

The validation process followed this idea:

```text
Desired End-Effector Position
        ↓
Inverse Kinematics
        ↓
Joint Angles
        ↓
Forward Kinematics
        ↓
Calculated End-Effector Position
```

If the calculated end-effector position matched the original desired position, the kinematic model was considered valid.

The project also validated:

- Inverse position kinematics
- Inverse velocity kinematics
- Inverse acceleration kinematics

## Joint Limitations

After testing different simulated configurations, the following joint limitations were identified:

```text
0° < q1 < 180°
0° < q2 < 180°
0° < q3 < 180°
45° < q4 < 135°
```

These limits were considered during trajectory planning to avoid invalid or mechanically unsafe positions.

## Trajectory Planning

Task-space trajectory planning was used to generate the motion required for the dish-washing task.

The trajectory was based on straight-line motion between initial and final coordinates. The equations used were:

```text
x = x0 + αt
y = y0 + αt
z = z0 + αt
```

The task was divided into several motion phases:

1. Move from the initial position to the loofah position.
2. Close the gripper to hold the loofah.
3. Move upward after grasping the loofah.
4. Move toward the dish position.
5. Perform the washing motion.
6. Move back to the loofah position.
7. Release the loofah.

## Simscape Simulation

The robotic arm was simulated using Simscape Multibody to check that the mechanism moved correctly and that the planned trajectories were feasible.

Different configurations were tested to compare the Simscape model with the MATLAB/Simulink kinematic calculations.

The simulation confirmed that:

- The robotic arm mechanism worked properly.
- The DH convention model and the Simscape model produced close values.
- The arm could move through the planned trajectory smoothly.
- There were no major part collisions during the simulated motion.

## Results

The project successfully achieved the design, modeling, simulation, and hardware implementation of the Poppy-inspired robotic arm.

The main achieved results were:

- The right arm of the Poppy Humanoid robot was modeled and assembled.
- A lightweight 2-jaw gripper was designed and fabricated.
- Forward kinematics was derived using the DH convention.
- MATLAB functions were implemented for forward and inverse kinematics.
- Simulink and Simscape models were used to validate the kinematic calculations.
- A task trajectory for dish washing was planned.
- The arm was fabricated using 3D printing.
- The real hardware motion was visually compared with the simulation.
- The hardware followed the planned trajectory closely and without unstable movements.

## Notes

This project was completed as part of a Robotics Systems course at the German University in Cairo.

## Author

Alaa Ali
