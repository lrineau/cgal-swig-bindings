%module CGAL_Triangulation_2

%include "../common.i"
%import  "../Common/Macros.h"
%import  "../Kernel/Point_2.h"
%import  "../Kernel/Segment_2.h"
%import  "../Kernel/Triangle_2.h"
%include "../Common/Input_iterator.h"

//include files
%{
  #include "Triangulation_2.h"
  #include "Delaunay_triangulation_2.h"
  #include "Regular_triangulation_2.h"
  #include "Constrained_triangulation_2.h"
  #include "Constrained_Delaunay_triangulation_2.h"
  #include "Constrained_triangulation_plus_2.h"
  #include "triangulation_handles.h"
  #include "triangulation_iterators.h"
%}

//definitions
%include "Triangulation_2.h"
%include "Delaunay_triangulation_2.h"
%include "Regular_triangulation_2.h"
%include "Constrained_triangulation_2.h"
%include "Constrained_Delaunay_triangulation_2.h"
%include "Constrained_triangulation_plus_2.h"
%include "triangulation_handles.h"
%include "triangulation_iterators.h"

%pragma(java) jniclassimports=%{import CGAL.Kernel.Point_2; import java.util.Iterator; import java.util.Collection;%}

//Constraint
%typemap(javaimports) std::pair<Point_2,Point_2> %{ import CGAL.Kernel.Point_2;%}
%include "std_pair.i"
%template(Constraint) std::pair<Point_2,Point_2>;

//typemap for point input iterator
Typemap_for_Input_iterator(Point_range,Point_2,Point_2::cpp_base,SWIGTYPE_p_Point_2,"(LCGAL/Kernel/Point_2;)J",insert_range)

//typemap for Constaints input iterator
%{
typedef std::pair<Point_2::cpp_base,Point_2::cpp_base> iConstraint;
%}
Typemap_for_Input_iterator(Constraint_range,Constraint,iConstraint,SWIGTYPE_p_std__pairT_Point_2_Point_2_t,"(LCGAL/Triangulation_2/Constraint;)J",insert_constraint_range)
#ifdef SWIGPYTHON
Typemap_for_Input_iterator_additional_function(Constrained_triangulation_2_wrapper::Constrained_triangulation_2_wrapper)
Typemap_for_Input_iterator_additional_function(Constrained_Delaunay_triangulation_2_wrapper::Constrained_Delaunay_triangulation_2_wrapper)
Typemap_for_Input_iterator_additional_function(Constrained_triangulation_plus_2_wrapper::Constrained_triangulation_plus_2_wrapper)
#endif

//%import "declare_triangulation_2.i"
//Declare_triangulation_2(Triangulation_2,EPIC_T2)

//%import "declare_constrained_triangulation_2.i"
//Declare_constrained_triangulation_2(Constrained_triangulation_2,EPIC_CT2)

//%import "declare_constrained_Delaunay_triangulation_2.i"
//Declare_constrained_Delaunay_triangulation_2(Constrained_Delaunay_triangulation_2,EPIC_CDT2)

%import "declare_constrained_Delaunay_triangulation_plus_2.i"
Declare_constrained_Delaunay_triangulation_plus_2(Constrained_Delaunay_triangulation_plus_2,EPIC_CDTplus2)
