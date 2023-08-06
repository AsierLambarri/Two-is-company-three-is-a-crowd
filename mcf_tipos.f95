module mcf_tipos
integer, parameter, public :: dp=selected_real_kind(15)
integer, parameter, public :: sp=selected_real_kind(6)
real(kind=dp), parameter, public :: eps_dp=1.0E-15_dp
real(kind=sp), parameter, public :: eps_sp=1.0E-6_sp
real(kind=dp), parameter, public :: pi_dp=acos(-1.0_dp)
real(kind=dp), parameter, public :: e_dp=exp(1.0_dp)
real(kind=sp), parameter, public :: pi_sp=acos(-1.0_sp)
real(kind=sp), parameter, public :: e_sp=exp(1.0_sp)
end module mcf_tipos
