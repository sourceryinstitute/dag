submodule(vertex_interface) vertex_implementation
  implicit none

contains

  module procedure set_edge_vector

    integer i

    if (allocated(me%edges)) then
      do i=1,size(edges)
          call me%add_edge(edges(i))
      end do
    else
      allocate(me%edges(size(edges)))  ! note: not checking for uniqueness here.
      me%edges = edges
    end if

  end procedure

  module procedure get_ivertex
    my_ivertex = me%ivertex
  end procedure

  module procedure get_checking
    my_checking = me%checking
  end procedure

  module procedure get_marked
    my_marked = me%marked
  end procedure

  module procedure add_edge

    if (allocated(me%edges)) then
      if (.not. any (edge==me%edges)) then
          me%edges = [me%edges, edge]
      end if
    else
      allocate(me%edges(1))
      me%edges = [edge]
    end if

  end procedure

end submodule
