program signal
  
  use, intrinsic :: iso_c_binding
  
  implicit none
  
  include 'fftw3.f03'

  
  integer, parameter :: Fs = 1024
  real(kind = 16) :: t = 0.0
  real(kind = 16) :: dt = 1/real(Fs-1)
  type(c_ptr) :: planf
  real(c_double), allocatable:: written_x(:)
  complex(c_double_complex), allocatable:: written_freq(:)
  real, parameter :: Pi = 3.1415927
  real(kind=16) :: val
  integer:: i

  open(unit=10, file = "/home/anna/Fortran/zad2/res/signal_time", action='write')
  open(unit=20, file = "/home/anna/Fortran/zad2/res/signal_freq", action='write')

  allocate(written_x(Fs))
  allocate(written_freq(Fs/2 + 1))

  do i=1, Fs
     
     t=t+dt
     written_x(i)= sin(2 * Pi * t * 200) + 2 * sin(2 * Pi * t * 400)
     write(10,*) t, " ", written_x(i)
     
  end do

  planf = fftw_plan_dft_r2c_1d(size(written_x), written_x, written_freq, FFTW_ESTIMATE+FFTW_UNALIGNED)
  call fftw_execute_dft_r2c(planf, written_x, written_freq)
  

  do i=1,Fs/2+1
     
     val=abs(written_freq(i))
     if(val /= val)val=0.0
     write(20,'(I15," ", F15.10)')i, val
     
  end do
  
  call fftw_destroy_plan(planf)
 
  end program signal
