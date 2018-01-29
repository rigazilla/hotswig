%module Infinispan
%include "std_string.i"
%include "std_vector.i"
%{
#include "hotrod-facade.h"
%}

%template(UCharVector) std::vector<unsigned char>;
%include "hotrod-facade.h"
