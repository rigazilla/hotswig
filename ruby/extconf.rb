require 'mkmf'

with_cflags('-x c++') do
find_header('hotrod-facade.h', '../include')
find_header('infinispan/hotrod/Configuration.h', '../prebuilt/usr/include')
$srcs = ["../src/hotrod-facade.cpp","hotswig_wrap.cxx"]
$VPATH << "$(srcdir)/../src"
find_library("hotrod",nil,"../prebuilt/usr/lib")
create_makefile('hotswig')
end
