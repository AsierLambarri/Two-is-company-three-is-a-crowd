module leapfrog

public :: leapfrog_paso_dp 

contains

subroutine leapfrog_paso_dp(x,y,f,h)
use mcf_tipos

real(kind=dp), intent(inout)                :: x
real(kind=dp), dimension(:), intent(inout)  :: y
real(kind=dp), intent(in)                   :: h
interface
   function f(x,y) result(yprima)
    use mcf_tipos
    real(kind=dp), intent(in)               :: x
    real(kind=dp), dimension(:), intent(in) :: y
    real(kind=dp), dimension(size(y))       :: yprima
   end function f
end interface
real(kind=dp), parameter                    :: w0=-2**(1.0_dp/3.0_dp)/(2-2**(1.0_dp/3.0_dp)), w1=1.0_dp/(2-2**(1.0_dp/3.0_dp))
real(kind=dp), dimension(4)                 :: c, d
real(kind=dp), dimension(size(y))           :: a
c(1)=w1/2.0_dp
c(4)=w1/2.0_dp
c(2)=(w0+w1)/2.0_dp
c(3)=(w0+w1)/2.0_dp
d(1)=w1
d(3)=w1
d(2)=w0
d(4)=0.0_dp

do i=1,4
do j=1,size(y),2
        y(j)=y(j)+c(i)*y(j+1)*h
end do
a=f(x,y)
do j=1,size(y),2
        y(j+1)=y(j+1)+d(i)*a(j+1)*h
end do
end do
x=x+h
end subroutine leapfrog_paso_dp



end module leapfrog
