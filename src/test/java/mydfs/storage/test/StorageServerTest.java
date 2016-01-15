package mydfs.storage.test;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import mydfs.storage.server.MydfsTrackerServer;

import org.junit.Test;

public class StorageServerTest {
	/*
	public static void main(String[] args) throws IOException{
		MydfsStorageServer storageServer=new MydfsStorageServer(9999,"/data/mydfs/store",4,"localhost");
		storageServer.startServer();
	}*/
	@Test
	public void upload() throws IOException{
		MydfsTrackerServer client=new MydfsTrackerServer("localhost", 9999);
		InputStream inputStream = new FileInputStream("/home/wuqiwei/dengni37.jpg");
		String storepath = client.upload(inputStream,"jpg");
		System.out.println(storepath);
	}
	@Test
	public void remove(){
		MydfsTrackerServer client=new MydfsTrackerServer("127.0.0.1", 9999);
		String url="http://www.jobs.com/group/M00/78/79/53D9-34E2-4110-BDBA-8BF808E2C4BD.swf";
		boolean success = client.removeData(url);
		System.out.println("删除情况："+success);
	}
}
