package cn.believeus.dao;

import java.util.List;


public interface IBaseDao {

	public abstract void saveOrUpdate(Object object);
	public abstract void delete(Class<?> clazz, List<?> idList);

	public abstract void delete(Class<?> clazz, Integer id);

	public abstract void delete(Object entity);

	public abstract void delete(Class<?> clazz, String property, Object value);

	public abstract Object findObject(Class<?> clazz, Object property,
			Object value);

	public abstract Object findObject(Class<?> clazz, Integer id);

	public abstract List<?> findObjectList(Class<?> clazz, Object property,
			Object value);


	public abstract List<?> findObjectList(Class<?> clazz, Object property,
			Object value1, Object property2, Object value2);

	public abstract List<?> findObjectList(Class<?> clazz);

	public abstract List<?> findObjectList(Class<?> clazz, Integer num);

	public abstract List<?> findObjectList(Class<?> clazz, String property,
			Object value, int num);


}