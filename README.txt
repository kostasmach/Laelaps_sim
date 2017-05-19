===========================================================================
General info
===========================================================================
2d Simulation of a dynamic model of our quadruped robot Laelaps
Created by Konstantinos Machairas (kmach@central.ntua.gr) - 9/2016
Personal page: http://www.kmachairas.com
Lab page: http://csl-ep.mech.ntua.gr

Robot parameters can be found here: 
http://nereus.mech.ntua.gr/laelaps-wiki/index.php/Simulation
Dynamics were derived with Mathematica
Mathematica file: "Quadruped_model_2_segmented_springy_legs.nb"



===========================================================================
User Guide (with default options)
===========================================================================
Run main.m
- the simulation will run for 10 seconds (see time in command window)
- a first animation will run
- a postprocessing script will run (see time in command window)
- a second animation with more info will run
- results will appear in various figures

Modify main.m to set:
- different initial conditions
- different robot parameters
- different simulation time
- different ode solver or different solver parameters
- different ground properties

Comment out the corresponding lines in main.m to run only the 
functions you want after simulation is over. 

Modify controller_high_level.m to try different locomotion scenarios.



===========================================================================
Scripts and Functions described
===========================================================================

---------------------------------------------------------------------------
main.m
---------------------------------------------------------------------------
Run this script to start the simulation. By default you don't need to run
any other scripts; results will appear automatically.

Settings for:
- model parameters
- initial conditions
- ground properties
- solver parameters

Functions called: 
- mass.m
- dynamics.m
- post_processing.m
- animation.m
- animation_post_proc.m
- plot_data.m


---------------------------------------------------------------------------
mass.m
---------------------------------------------------------------------------
Returns the mass matrix M of the Equations of Motion (EoM), described in 
the form: M(x,x') * x' = F(x,x').


---------------------------------------------------------------------------
dynamics.m
---------------------------------------------------------------------------
Returns the F matrix of the Equations of Motion (EoM), described in the
form: M(x,x') * x' = F(x,x'). The function prints running time in 
the command window.

Functions called: 
- ground_forces.m
- controller_high_level.m


---------------------------------------------------------------------------
ground_forces.m
---------------------------------------------------------------------------
Returns normal forces and frictional forces from the ground as well as 
four variables (slipFR, slipHR, slipFL, slipHL) that indicate whether 
a toe slipped. A typical compliant Hunt-Crossley model is used for the 
normal ground forces, and a simple model that predicts slipping and 
sticking for the frictional forces (see friction_model.m).


---------------------------------------------------------------------------
friction_model.m
---------------------------------------------------------------------------
A script used only for visualization of the friction model, and not used
in simulation. Run the script to get a frictional force - velocity plot.


---------------------------------------------------------------------------
controller_high_level.m
---------------------------------------------------------------------------
Calls the low level controllers with the desired parameters. Modify this
function to generate different gait scenarios. The control scheme used
is the one described in:

Machairas, K. and Papadopoulos, E., “An Active Compliance Controller for
Quadruped Trotting,” 24th Mediterranean Conference on Control and 
Automation (MED ‘16), June 21-24, 2016, Athens, Greece.

Functions called:
- controller_toe_traj.m
- controller_toe_pos.m
- motor_limits_enable.m


---------------------------------------------------------------------------
controller_toe_traj.m
---------------------------------------------------------------------------
Returns the torques necessary for the toes to perform elliptical or 
semi elliptical trajectories using inverse kinematiks and PD controllers.


---------------------------------------------------------------------------
controller_toe_pos.m
---------------------------------------------------------------------------
Returns the torques necessary to position the toes to a (x,y) point in
the leg's workspace using PD controllers.


---------------------------------------------------------------------------
motor_limits_enable.m
---------------------------------------------------------------------------
Puts limits on the actuators' torques.


---------------------------------------------------------------------------
rect_2.m
---------------------------------------------------------------------------
Plots a rectangle used for plotting the robot's body.


---------------------------------------------------------------------------
post_processing.m
---------------------------------------------------------------------------
Many variables are not saved during simulation. Run the script after 
simulation is over to get all the results (ground forces, control torques
etc) based on the simulation results. The script prints processing time 
in the command window. It may take a while.

Functions called:
- ground_forces.m
- controller_high_level.m


---------------------------------------------------------------------------
animation.m
---------------------------------------------------------------------------
You can run this script before post_processing.m as it only animates the 
motion with minimum information.


---------------------------------------------------------------------------
animation_postproc.m
---------------------------------------------------------------------------
Run this script only after post_processing has run. It shows an animation 
with more data than animation.m.


---------------------------------------------------------------------------
animation_postproc_2.m
---------------------------------------------------------------------------
Same as animation_post_proc.m but with camera fixed to the global frame.


---------------------------------------------------------------------------
animation_video.m
---------------------------------------------------------------------------
Run this script only after post_processing and if you want to save frames 
to make a video out of them (using another software e.g. Adobe Premiere).


---------------------------------------------------------------------------
plot_data.m
---------------------------------------------------------------------------
This script runs all the scripts located in the plot_functions folder, and
produces plots with all the results available.

