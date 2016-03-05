package cn.believeus.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.stereotype.Service;

import redis.clients.util.SafeEncoder;


@Service
public class CacheService{
	
	@Resource
	private RedisTemplate<String,String> redisTemplate;
	
	
	public String get(final String key, final Integer dbIndex) {
		return this.redisTemplate.execute(new RedisCallback<String>(){
			@Override
			public String doInRedis(RedisConnection connection)throws DataAccessException {
				connection.select(dbIndex);
				byte [] temp = connection.get(key.getBytes());
				if(temp!=null){
					return SafeEncoder.encode(temp);
				}
				return null;
			}
		});
	}
	
	/**
	 * 分页查询 redis dbIndex 池的数据
	 */
	public List<String> findObjectList(final int dbIndex,final int count,final String key,final int pageIndex) {
		return this.redisTemplate.execute(new RedisCallback<List<String>>(){
			@Override
			public List<String> doInRedis(RedisConnection connection)throws DataAccessException {
				connection.select(dbIndex);
				List<String> resultList = new ArrayList<String>();
				ScanOptions scanOptions = ScanOptions.scanOptions().match(key).count(count).build();
				Cursor<byte[]> reCursor = connection.scan(scanOptions);
				while (reCursor.hasNext()) {
					String  str = new String(reCursor.next());
					if (reCursor.getPosition()<=((pageIndex-1)*count)) {
						continue;
					}
					else if (reCursor.getPosition()>((pageIndex-1)*count)&&reCursor.getPosition()<=((pageIndex)*count)) {
						resultList.add(new String(str));
					}
					else if(reCursor.getPosition() > ((pageIndex - 1) * count)){
						break;
					}
				}
				return resultList;
			}
		});
	}
	
	
	public void set(final String key, final String value, final Integer dbIndex) {
		this.redisTemplate.execute(new RedisCallback<Object>(){
			@Override
			public Object doInRedis(RedisConnection connection)throws DataAccessException {
				connection.select(dbIndex);
				connection.set(key.getBytes(),value.getBytes());
				return null;
			}
		});
	}

	public void setCacheValue(final String key, final Integer seconds, final String value,final Integer dbIndex) {
		this.redisTemplate.execute(new RedisCallback<Object>(){
			@Override
			public Object doInRedis(RedisConnection connection)throws DataAccessException {
				connection.select(dbIndex);
				connection.setEx(key.getBytes(),seconds,value.getBytes());
				return null;
			}
		});
	}
	/**
	 * 
	 * 更新失效时间
	 */
	public void setExpire(final String key, final Integer seconds, final Integer dbIndex) {
		this.redisTemplate.execute(new RedisCallback<Object>(){
			@Override
			public Object doInRedis(RedisConnection connection)throws DataAccessException {
				connection.select(dbIndex);
				connection.expire(key.getBytes(),seconds);
				return null;
			}
		});
	}
	
	public void delBykey(final Integer dbIndex, final String key) {
		this.redisTemplate.execute(new RedisCallback<Object>(){
			@Override
			public Object doInRedis(RedisConnection connection)throws DataAccessException {
				connection.select(dbIndex);
				connection.del(key.getBytes());
				return null;
			}
		});
	}
	
	/**
	 * 清空数据库 param:Integer dbIndex(数据库的标识)
	 */
	public void redisFlushdb(final Integer dbIndex) {
		
		this.redisTemplate.execute(new RedisCallback<Object>(){
			@Override
			public Object doInRedis(RedisConnection connection)throws DataAccessException {
				connection.select(dbIndex);
				connection.flushDb();
				return null;
			}
		});
	}

	public List<String> getAllKeys(final Integer dbIndex) {
		return this.redisTemplate.execute(new RedisCallback<List<String>>(){
			@Override
			public List<String> doInRedis(RedisConnection connection)throws DataAccessException {
				List<String> result = new ArrayList<String>();
				connection.select(dbIndex);
				Set<byte[]> keys = connection.keys("*".getBytes());
				for(byte[] key : keys){
					result.add(SafeEncoder.encode(key));
				}
				return result;
			}
		});
	}

	public void setCacheValueByJedis(final List<String> keyList,final String value, final Integer dbIndex) {
		this.redisTemplate.execute(new RedisCallback<List<String>>(){
			@Override
			public List<String> doInRedis(RedisConnection connection)throws DataAccessException {
				connection.select(dbIndex);
				connection.multi();
				if(keyList!=null&&keyList.size()>0){
				for(String obj:keyList){
					connection.set(obj.getBytes(), value.getBytes());
				}
				connection.exec();
			}
				return null;
			}
		});
		
		
	}

	public void delBykeyByJedis(final List<String> keyList,final Integer dbIndex) {
		this.redisTemplate.execute(new RedisCallback<List<String>>(){
			@Override
			public List<String> doInRedis(RedisConnection connection)throws DataAccessException {
				connection.select(dbIndex);
				connection.multi();
				if(keyList!=null&&keyList.size()>0){
				for(String obj:keyList){
					connection.del(obj.getBytes());
				}
				connection.exec();
			}
				return null;
			}
		});		
			
	}
	
	/**
	 * 获取 redis dbIndex池的数据总数
	 */
	public Long size(final int dbIndex) {
		return this.redisTemplate.execute(new RedisCallback<Long>(){
			@Override
			public Long doInRedis(RedisConnection connection)throws DataAccessException {
				connection.select(dbIndex);
				return connection.dbSize();
			}
		});	
	}
	
}


