package cn.believeus.init;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Component
public class InitIndex implements ApplicationListener<ApplicationEvent>{
	@Resource
	private SessionFactory sessionFactory;
	private boolean isIndex=true;
	@Override
	public void onApplicationEvent(ApplicationEvent event) {
//		if(event instanceof ContextRefreshedEvent){
//			if(isIndex==true){
//				try {
//					Session session = sessionFactory.openSession();
//					FullTextSession fullTextSession = Search.getFullTextSession(session);
//					fullTextSession.createIndexer().startAndWait();
//				} catch (InterruptedException e) {
//					e.printStackTrace();
//				}
//			}
//			isIndex=false;
//		}
		
	}

}
