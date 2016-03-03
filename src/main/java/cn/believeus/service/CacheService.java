package cn.believeus.service;

import javax.annotation.Resource;

import org.springframework.cache.Cache;
import org.springframework.cache.Cache.ValueWrapper;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Service;

@Service
public class CacheService {
	@Resource
	private EhCacheCacheManager ehCacheCacheManager;

	public Object get(String cachename, Object key) {
		Cache cache = ehCacheCacheManager.getCache(cachename);
		ValueWrapper valueWrapper = cache.get(key);
		if (valueWrapper != null) {
			return cache.get(key).get();
		}
		return valueWrapper;
	}

	public void put(String cachename, Object key, Object value) {
		Cache cache = ehCacheCacheManager.getCache(cachename);
		cache.put(key, value);
	}

	public void evict(String cachename, Object key) {
		Cache cache = ehCacheCacheManager.getCache(cachename);
		cache.evict(key);
	}
}
