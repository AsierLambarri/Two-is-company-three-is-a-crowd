module functions

use mcf_tipos

public :: E_inter, grad_E, F

real(kind=dp), public :: k      !parametroak
real(kind=dp), allocatable, dimension(:), public :: m

contains
        function E_inter(x1,y1,z1,m1,x2,y2,z2,m2)
                real(kind=dp), intent(in) :: x1,y1,z1,x2,y2,z2,m1,m2
                real(kind=dp) :: E_inter

                E_inter=-k*m1*m2/sqrt((x1-x2)**2.0_dp+(y1-y2)**2.0_dp)
        end function E_inter

        function grad_E(x1,y1,z1,m1,x2,y2,z2,m2)
                real(kind=dp), intent(in) :: x1,y1,z1,x2,y2,z2,m1,m2
                real(kind=dp) :: h
                real(kind=dp), dimension(3) :: grad_E 
                h=1.0E-5_dp

                grad_E(1)=(E_inter(x1+h,y1,z1,m1,x2,y2,z2,m2)-E_inter(x1-h,y1,z1,m1,x2,y2,z2,m2))/(2*h)
                grad_E(2)=(E_inter(x1,y1+h,z1,m1,x2,y2,z2,m2)-E_inter(x1,y1-h,z1,m1,x2,y2,z2,m2))/(2*h)
                grad_E(3)=(E_inter(x1,y1,z1+h,m1,x2,y2,z2,m2)-E_inter(x1,y1,z1-h,m1,x2,y2,z2,m2))/(2*h)

        end function grad_E

        function F(t,y)
                real(kind=dp), dimension(:), intent(in) :: y
                real(kind=dp), intent(in) :: t
                real(kind=dp), dimension(size(y)) :: F
                real(kind=dp), dimension(3) :: aux
                real(kind=dp) :: sum_Fx, sum_Fy, sum_Fz
                integer :: i, j, n_particula, n_particula_2
                n_particula=1

                do i=1, size(y), 6
                        n_particula_2=1

                        sum_Fx=0.0_dp
                        sum_Fy=0.0_dp
                        sum_Fz=0.0_dp

                        F(i)=y(i+1)
                        F(i+2)=y(i+3)
                        F(i+4)=y(i+5)

                        
                        do j=1, size(y), 6
                               
                                if( i/=j) then

                                        aux=grad_E(y(i),y(i+2),y(i+4),m(n_particula),y(j),y(j+2),y(i+4),m(n_particula_2))

                                        sum_Fx=sum_Fx+aux(1)
                                        sum_Fy=sum_Fy+aux(2)
                                        sum_Fz=sum_Fz+aux(3)
                                end if

                                n_particula_2=n_particula_2+1

                        end do
                        
                        F(i+1)=-sum_Fx/m(n_particula)
                        F(i+3)=-sum_Fy/m(n_particula)
                        F(i+5)=-sum_Fz/m(n_particula)
                        n_particula=n_particula+1
                       
                end do
        end function F

                












end module functions
