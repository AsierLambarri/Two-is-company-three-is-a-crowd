# Two's company three's a crowd

N-body simulation coded in Fortran 95 started as a side project while taking a Computational Methods course in UPV/EHU in 2022. This code computes the trajectories of an arbitrary number of particles given a suitable set of initial conditions, and is able to detect any collisions between particles. The advantage of using Fortran for this task, when compared with other more moderns languages such as Python, is its speed, given that the number of computations required increases as n², were n is the number of particles.

Runge-Kutta 4 and the simplectic fourth-order Leapfrog methods are implemented for the integration of the equations of motion and the force exerted on each particle is calculated by numerically differentiating the potential. Thus, the code is able to work with any potential energy of your liking. This method for calculating the force was selected because the expression for the potential energy of a particle is usually easier to write than the force it feels, still, this may be changed and an exact expression for the force F(x,y,z) may be substituted. Everything is done in cartesian coordinates.

## Code information

There are several functions built into functions.f95 and RK4 and Leapfrog methods have their own .f9x module. mcf_tipos.f95 has all the information regarding various parameters that are used in the main program: main.f95. Initial conditions must be specified and the form of the potential energy/force must be entered directly in functions.f95. The main program must be compiled in the following way:

**> f95 mcf_tipos.f95 functions.f95 rk4.f90 leapfrog.f95 main.f95**

The result is an executable named a.out which, upon execution, creates a file named **fort.123** that contains the trajectories of each particle. Particle positions are written for each instant (a line in the file) as: x1 y1 z1 x2 y2 z2, and so on.


An example is shown bellow: a lemniscate dance for a three particle stable configuration under a newtonian potential. The motion happens in z=1. The gif is made with matplotlib.

<p alignt="center">
   <img src="https://github.com/AsierLambarri/Two-is-company-three-is-a-crowd/assets/109964584/50e547c6-740c-4970-bdff-f37cdc44322f.gif">
</p>


