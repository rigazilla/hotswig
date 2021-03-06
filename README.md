# hotswig

The goal of the Hotswig project is to build a Swig based facade in front of the Infinispan C++ Hotrod client that can generate clients for the Swig supported languages. The process and the resulting client should be:

* simple. Means the user should have no doubts about using Hotswig instead of developing its own solution for a specific language;
* extensibile. Means the user should be able to expose new features just extending the facade in a easy way.

## Requirements

* a prebuilt of the C++ client (build with the same compiler version we want to use). It should be unpack under ./prebuilt to use the default settings.
* swig 2.8.11


## Generate the client

Starting from the *swig/hotswig.i* swig specification, a client can be build with the following general procedure:

1. generate the C++ wrapping with swig
1. compile the wrapper with the facade and build a shared library
1. use the built and the hotrod shared library for development

In practice the procedure change slightly from language to language. Three examples are provided:

1. ruby example
1. cmake example for python
1. cmake example for octave

### Ruby
    cd ruby
    swig -c++ -ruby -outcurrentdir -I../include ../swig/hotswig.i
    ruby extconf.rb
    make && make install

Now test your client

    LD_LIBRARY_PATH=../prebuilt/usr/lib ruby client.rb

### Python
    mkdir build && cd build
    cmake ..
    cmake --build .

Test your client in a python shell

    LD_LIBRARY_PATH=../prebuild/usr/lib python
    import Infinispan
    conf=Infinispan.Configuration()
    conf.addServer("localhost",11222)
    conf.setProtocol("2.4")
    manager=Infinispan.RemoteCacheManager(conf)
    manager.start()
    key=Infinispan.UCharVector()
    key.push_back(56)
    value=Infinispan.UCharVector()
    value.push_back(8)
    cache=Infinispan.RemoteCache(manager)
    cache.put(key,value)
    res=cache.get(key)
    print res.pop()

### Octave
    mkdir build && cd build
    cmake .. -DTARGET_LANG=octave
    cmake --build .

Test your client in a Octave session

    LD_LIBRARY_PATH=../prebuilt/usr/lib octave
    Infinispan
    conf = Infinispan.Configuration()
    conf.addServer("localhost",11222)
    conf.setProtocol("2.4")
    manager=Infinispan.RemoteCacheManager(conf)
    manager.start()
    cache = Infinispan.RemoteCache(manager)
    key = Infinispan.UCharVector()
    key.push_back(56)
    value = Infinispan.UCharVector()
    value.push_back(8)
    cache.put(key,value)
    res = cache.get(key)
    res.pop()







