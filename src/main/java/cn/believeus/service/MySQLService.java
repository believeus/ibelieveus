package cn.believeus.service;

import java.util.List;
import javax.annotation.Resource;

import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.Query;
import org.apache.lucene.util.Version;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.springframework.stereotype.Service;
import org.wltea.analyzer.lucene.IKAnalyzer;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.dao.IBaseDao;
import cn.believeus.dao.MySQLDao;

@Service(value="mysqlService")
public class MySQLService implements IService{
	@Resource
	private IBaseDao mysqlDao;
	@Resource
	private SessionFactory sessionFactory;
	
	@Override
	public void saveOrUpdate(Object object) {
		((MySQLDao)mysqlDao).saveOrUpdate(object);
	}
	
	@Override
	public void delete(Class<?> clazz, Integer id) {
		((MySQLDao)mysqlDao).delete(clazz, id);
	}

	
	@Override
	public void delete(Object entity) {
		((MySQLDao)mysqlDao).delete(entity);
	}
	
	@Override
	public void delete(Class<?> clazz,List<?> ids){
		((MySQLDao)mysqlDao).delete(clazz, ids);
	}

	@Override
	public void delete(Class<?> clazz, String property, Object value) {
		((MySQLDao)mysqlDao).delete(clazz, property, value);
	}

	public Object findObject(String hql) {
		return ((MySQLDao)mysqlDao).findObject(hql);
	}

	@Override
	public Object findObject(Class<?> clazz, Object property, Object value) {
		return ((MySQLDao)mysqlDao).findObject(clazz, property, value);
	}

	@Override
	public Object findObject(Class<?> clazz, Integer id) {
		return ((MySQLDao)mysqlDao).findObject(clazz, id);
	}

	@Override
	public List<?> findObjectList(Class<?> clazz, Object property, Object value) {
		return ((MySQLDao)mysqlDao).findObjectList(clazz, property, value);
	}


	@Override
	public List<?> findObjectList(Class<?> clazz, Object property,
			Object value1, Object property2, Object value2) {
		return ((MySQLDao)mysqlDao).findObjectList(clazz, property, value1, property2, value2);
	}

	@Override
	public List<?> findObjectList(Class<?> clazz) {
		return ((MySQLDao)mysqlDao).findObjectList(clazz);
	}

	
	@Override
	public List<?> findObjectList(Class<?> clazz, Integer num) {
		return ((MySQLDao)mysqlDao).findObjectList(clazz, num);
	}

	
	@Override
	public List<?> findObjectList(Class<?> clazz, String property,
			Object value, int num) {
		return ((MySQLDao)mysqlDao).findObjectList(clazz, property, value, num);
	}
	
	public List<?> findObjecList(Class<?> clazz, String property, String value) {
		Session session = sessionFactory.openSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		QueryParser queryParser = new QueryParser(Version.LUCENE_36, property,new IKAnalyzer(true));
		Query luceneqQuery = null;
		try {
			luceneqQuery = queryParser.parse(value);
		} catch (Exception e) {
			e.printStackTrace();
		}
		FullTextQuery fullTextQuery = fullTextSession.createFullTextQuery(luceneqQuery, clazz);
		return fullTextQuery.list();
	}
	
	public List<?> findObjectList(String hql, Integer num) {
		return ((MySQLDao)mysqlDao).findObjectList(hql,num);
	}

	public Page<?> findObjectList(String hql, Pageable pageable) {
		return (Page<?>) ((MySQLDao)mysqlDao).getPageDateList(hql,pageable );
	}


}
