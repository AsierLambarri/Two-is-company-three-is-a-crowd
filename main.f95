program main
!dependencies
use mcf_tipos
use functions
use rk4
use leapfrog

real(kind=dp), allocatable, dimension(:) :: y
real(kind=dp), dimension(2) :: r1, r2
real(kind=dp) :: t0, tf, h, eps
integer :: N, i, j, ii, jj, kk, np, p1, p2

!The first part of this program may be modified and the number of particles and I.C.'s may be loaded
!from a file. For that, keep in mind that the state vector "y" is defined as follows:
!y=(/x1, vx1, y1, vy1, z1, vz1, x2, vx2, y2, vy2,.../)

!initializing parameters: coupling constant, number of particles and collision criterions (eps)
k=1.0_dp 
np=3
eps=5.0E-3_dp

allocate(m(np), y(6*np))

!initial conditions: mases positions and velocities
m(1)=1.0_dp
m(2)=1.0_dp
m(3)=1.0_dp

y(1)=-0.97000436_dp
y(2)=0.466203685_dp
y(3)=0.24308753_dp
y(4)=0.43236573_dp
y(5)=1.0_dp
y(6)=0.0_dp

y(7)=0
y(8)=-0.93240737_dp
y(9)=0
y(10)=-0.86473146_dp
y(11)=1.0_dp
y(12)=0.0_dp

y(13)=0.97000436_dp
y(14)=0.466203685_dp
y(15)=-0.24308753_dp
y(16)=0.43236573_dp
y(17)=1.0_dp
y(18)=0.0_dp


!number of steps and length of the simulations. Its better to touch these and not h
N=20000
t0=0.0_dp
tf=20.0_dp

h=(tf-t0)/N


do i=1,N
        write(unit=123, fmt="(50e25.15)") (y(j), j=1,6*np,2)

        !call rk4_paso_dp(t0,y,F,h)
        call leapfrog_paso_dp(t0,y,F,h)
        p1=0
        
        do ii=1,4*np, 4
                p1=p1+1
                p2=0
                r1(1)=y(ii)
                r1(2)=y(ii+2)
                do jj=1,4*np, 4
                        p2=p2+1
                        r2(1)=y(jj)
                        r2(2)=y(jj+2)
                        if (ii/=jj .and. abs(r1(1)-r2(1))<eps .and. abs(r1(2)-r2(2))<eps) then
                        write(unit=*, fmt="(a,i2,a,i2,a,2f20.15,a,2f20.15)") "particles  ",p1,"  and  ",p2, "  collided at  ", &
                                r1,"( ",r2, " )"
                                print*,"simulation stopped"
                                stop
                        end if
                end do
        end do


end do

close(unit=123)
deallocate(m)

end program main
