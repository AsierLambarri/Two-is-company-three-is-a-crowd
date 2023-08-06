# Two's company three's a crowd

N-body simulation coded in Fortran 95 started as a side project while taking a Computational Methods course in UPV/EHU in 2022. This code computes the trajectories of an arbitrary number of particles given a suitable set of initial conditions, and is able to detect any collisions between particles. The advantage of using Fortran for this task, when compared with other more moderns languages such as Python, is its speed, given that the number of computations required increases as n², were n is the number of particles.

Runge-Kutta 4 and the simplectic fourth-order Leapfrog methods are implemented for the integration of the equations of motion and the force exerted on each particle is calculated by numerically differentiating the potential. Thus, the code is able to work with any potential energy of your liking. This method for calculating the force was selected because the expression for the potential energy of a particle is usually easier to write than the force it feels, still, this may be changed and an exact expression for the force F(x,y,z) may be substituted. Everything is done in cartesian coordinates.






![movie](https://github.com/AsierLambarri/Two-is-company-three-is-a-crowd/assets/109964584/efdf3b0c-2295-45f2-8534-c4ce7a0f3df2.gif)
