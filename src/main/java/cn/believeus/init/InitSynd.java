package cn.believeus.init;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Component
public class InitSynd implements ApplicationListener<ApplicationEvent>{
	
	private boolean isread=true;
	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if(event instanceof ContextRefreshedEvent){
			if(isread==true){
				isread=false;
				//获取项目classes存放目录
				String url = InitSynd.class.getResource("/").getFile().toString();
				String sicksynd=url+"sicksynd/";
				File file=new File(sicksynd);
				
				System.out.println(file.toString());
				for(String f: file.list()){
					try {
						List<String> readLines = IOUtils.readLines(new FileReader(new File(file.getAbsoluteFile()+"/"+f)));
						for (String line : readLines) {
							System.out.println(line);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} 
				}
			}
			
		}
	}

}
