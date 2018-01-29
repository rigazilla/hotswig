require 'Infinispan'
conf = Infinispan::Configuration.new
conf.addServer("localhost",11222)
conf.setProtocol("2.4")
manager = Infinispan::RemoteCacheManager.new(conf)
manager.start()
cache = Infinispan::RemoteCache.new(manager)
key = Infinispan::UCharVector.new
key.push(56)
value = Infinispan::UCharVector.new
value.push(8)
cache.put(key,value)
res = cache.get(key)
p res
