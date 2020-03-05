program main

!*****************************************************************************80
!
!! MAIN sets up the data for sparse matrix example 3.
!
!  Modified:
!
!    30 August 2006
!
!  Author:
!
!    John Burkardt
!
  implicit none

  integer, parameter :: x_num = 5
  integer, parameter :: y_num = 5

  real ( kind = 8 ), allocatable, dimension ( : ) :: a
  integer, allocatable, dimension ( : ) :: col
  integer j
  integer k
  integer n
  integer nnzero
  integer, allocatable, dimension ( : ) :: row
  integer x
  integer y

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) 'X03_CC_SETUP:'
  write ( *, '(a)' ) '  Set up the sparse compressed column arrays associated'
  write ( *, '(a)' ) '  with a finite difference approximation to the second'
  write ( *, '(a)' ) '  derivative operator on an equally spaced grid of'
  write ( *, '(a)' ) '  X_NUM by Y_NUM nodes.'
  write ( *, '(a)' ) ' '
  write ( *, '(a,i8)' ) '  Number of nodes in X direction X_NUM     = ', x_num
  write ( *, '(a,i8)' ) '  Number of nodes in Y direction Y_NUM     = ', y_num
!
!  Get the number of variables, and the number of nonzeros.
!
  n = x_num * y_num
  call x03_nonzero_count ( x_num, y_num, nnzero )

  write ( *, * ) ' '
  write ( *, '(a,i8)' ) '  Number of variables N     = ', n
  write ( *, '(a,i8)' ) '  Number of nonzeros NNZERO = ', nnzero
!
!  Allocate memory.
!
  allocate ( a(1:nnzero) )
  allocate ( col(1:n+1) )
  allocate ( row(1:nnzero) )
!
!  Set the sparse matrix data structure and data.
!
  call x03_nonzero_cc ( x_num, y_num, n, nnzero, col, row, a )
!
!  Now print out the arrays.
!
  write ( *, '(a)' ) ' '

  do j = 1, n+1
    write ( *, * ) j, col(j)
  end do

  write ( *, '(a)' ) ' '

  do j = 1, n
    write ( *, '(a)' ) ' '
    do k = col(j), col(j+1)-1
      write ( *, * ) row(k), j, a(k)
    end do
  end do
!
!  Write the arrays to files.
!
  open ( unit = 1, file = 'x03_j.txt', status = 'replace' )
  do j = 1, n+1
    write ( 1, '(i8)' ) col(j)
  end do
  close ( unit = 1 )

  open ( unit = 1, file = 'x03_i.txt', status = 'replace' )
  do j = 1, nnzero
    write ( 1, '(i8)' ) row(j)
  end do
  close ( unit = 1 )

  open ( unit = 1, file = 'x03_a.txt', status = 'replace' )
  do j = 1, nnzero
    write ( 1, '(f10.4)' ) a(j)
  end do
  close ( unit = 1 )

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) 'X03_CC_SETUP:'
  write ( *, '(a)' ) '  Normal end of execution.'

  deallocate ( a )
  deallocate ( col )
  deallocate ( row )

  stop
end
subroutine x03_nonzero_count ( x_num, y_num, nnzero )

!*****************************************************************************80
!
!! X03_NONZERO_COUNT determines the number of nonzero entries.
!
!  Discussion:
!
!    Assume nodes are numbered as illustrated below:
!
!      9-10-11-12
!      |  |  |  |
!      5--6--7--8
!      |  |  |  |
!      1--2--3--4
!
!    J counts the variable, and the column of the matrix.
!
!    We march throught the grid, and ask, does J occur in the equation
!    associated with this node? 
!
!    We know that J will be part of the equations associated with the
!    nodes to the north, south, east, and west, as well as its own 
!    equation. 
!
!  Modified:
!
!    30 August 2006
!
!  Author:
!
!    John Burkardt
!
  implicit none

  integer nnzero
  integer x
  integer x_num
  integer y
  integer y_num

  nnzero = 0

  do y = 1, y_num
    do x = 1, x_num

      if ( 1 < y ) then
        nnzero = nnzero + 1
      end if

      if ( 1 < x ) then
        nnzero = nnzero + 1
      end if

      nnzero = nnzero + 1

      if ( x < x_num ) then
        nnzero = nnzero + 1
      end if

      if ( y < y_num ) then
        nnzero = nnzero + 1
      end if

    end do
  end do

  return
end
subroutine x03_nonzero_cc ( x_num, y_num, n, nnzero, col, row, a )

!*****************************************************************************80
!
!! X03_NONZERO_CC sets the sparse matrix data structure and data.
!
!  Discussion:
!
!    We are setting up the matrix in sparse compressed column storage format.
!
!    Assume nodes are numbered as illustrated below:
!
!      9-10-11-12
!      |  |  |  |
!      5--6--7--8
!      |  |  |  |
!      1--2--3--4
!
!    J counts the variable, and the column of the matrix.
!
!    We march throught the grid, and ask, does J occur in the equation
!    associated with this node?  If so, we increment K, the number of
!    nonzeros.  We increment NUM(J), the number of nonzeros in that column.
!    We set ROW and A.
!
!  Modified:
!
!    30 August 2006
!
!  Author:
!
!    John Burkardt
!
  implicit none

  integer n
  integer nnzero

  real ( kind = 8 ) a(nnzero)
  integer col(n+1)
  integer j
  integer k
  integer num(n)
  integer row(nnzero)
  integer x
  integer x_num
  integer y
  integer y_num

  j = 0
  k = 0
  num(1:n) = 0

  do y = 1, y_num
    do x = 1, x_num

      j = j + 1

      if ( 1 < y ) then
        k = k + 1
        num(j) = num(j) + 1
        row(k) = j - x_num
        a(k) = -1.0D+00
      end if

      if ( 1 < x ) then
        k = k + 1
        num(j) = num(j) + 1
        row(k) = j - 1
        a(k) = -1.0D+00
      end if

      k = k + 1
      num(j) = num(j) + 1
      row(k) = j
      a(k) = 4.0D+00

      if ( x < x_num ) then
        k = k + 1
        num(j) = num(j) + 1
        row(k) = j + 1
        a(k) = -1.0D+00
      end if

      if ( y < y_num ) then
        k = k + 1
        num(j) = num(j) + 1
        row(k) = j + x_num
        a(k) = -1.0D+00
      end if

    end do
  end do
!
!  Now use the NUM array to create the column pointer array.
!
  col(1) = 1
  do j = 1, n
    col(j+1) = col(j) + num(j)
  end do

  return
end
