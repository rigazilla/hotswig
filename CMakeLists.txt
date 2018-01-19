cmake_minimum_required (VERSION 2.8.11)
project (hotswig)
find_package(SWIG REQUIRED)
include(${SWIG_USE_FILE})
    
#load the package that SWIG uses to generate Python
find_package(PythonLibs)
    
#point to python headers
include_directories(${PYTHON_INCLUDE_DIRS})

include_directories(include prebuilt/usr/include)
link_directories(prebuilt/usr/lib)
set_property(SOURCE swig/hotswig.i PROPERTY CPLUSPLUS ON)
swig_add_module(HotrodClient python swig/hotswig.i src/hotrod-facade.cpp)
swig_link_libraries (HotrodClient hotrod)

