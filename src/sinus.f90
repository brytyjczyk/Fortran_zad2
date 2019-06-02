program sinus
  use, intrinsic :: iso_c_binding
    
  implicit none
  
  include 'fftw3.f03'


  integer, parameter :: Fs = 1024
  real(kind=16) :: t=0.0
  real(kind=16) :: dt=10/real(Fs-1)
  real(kind=16) :: val
  integer :: i
  integer, parameter :: seed = 74586
  
  real(c_double), allocatable :: in(:)
  complex(c_double_complex), allocatable :: out(:)
  type(c_ptr) :: planf, planb
  

  open(unit=10, file = "/home/anna/Fortran/zad2/res/clear_sinus", action='write')
  open(unit=20, file = "/home/anna/Fortran/zad2/res/noisy_sinus", action='write')
  open(unit=30, file = "/home/anna/Fortran/zad2/res/sinus_noisy_f", action='write')
  open(unit=40, file = "/home/anna/Fortran/zad2/res/sinus_cleared_f", action='write')
  open(unit=50, file = "/home/anna/Fortran/zad2/res/sinus_cleared_time", action='write')

  allocate(in(Fs))
  allocate(out(Fs/2 +1))

  do i=1, Fs
     t=t+dt
     write(10,*) t, " ", sin(t)
     in(i)= sin(t) + rand()
     write(20,*)t, " ", 0.002* in(i)
  end do

  planf = fftw_plan_dft_r2c_1d(size(in), in, out, FFTW_ESTIMATE+FFTW_UNALIGNED)
  planb = fftw_plan_dft_c2r_1d(size(in), out, in, FFTW_ESTIMATE+FFTW_UNALIGNED)
  call fftw_execute_dft_r2c(planf, in, out)

  do i=1, Fs/2 +1
     val = abs(in(i))
     if(val/= val) val=0.0
     write(30, '(I15, " ", F15.10)')i, val

     if(abs(out(i))<50) out(i)=0.0
  end do
  do i=1, Fs/2 +1
     write(40, '(I15, " ", F15.10)') i, abs(out(i))
  end do

  call fftw_execute_dft_c2r(planb, out, in)

  t=0.0
  dt=10/real(Fs-1)
  do i=1, fs
     t=t+dt
     write(50, *) t, " ", in(i)/Fs
  end do

  call fftw_destroy_plan(planf)
  call fftw_destroy_plan(planb)

  close(10)
  close(20)
  close(30)
  close(40)
  close(50)
  
  end program sinus
