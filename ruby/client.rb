require 'hotswig'
conf = Hotswig::Configuration.new
conf.addServer("localhost",11222)
conf.setProtocol("2.4")
manager = Hotswig::RemoteCacheManager.new(conf)
manager.start()
cache = Hotswig::RemoteCache.new(manager)
key = Hotswig::UCharVector.new
key.push(56)
value = Hotswig::UCharVector.new
value.push(8)
cache.put(key,value)
res = cache.get(key)
p res
