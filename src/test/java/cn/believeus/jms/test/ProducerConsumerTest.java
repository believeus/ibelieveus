package cn.believeus.jms.test;
import java.util.UUID;

import javax.annotation.Resource;
import javax.jms.Destination;  
   
import org.junit.Test;  
import org.junit.runner.RunWith;  
import org.springframework.test.context.ContextConfiguration;  
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;  
import cn.believeus.jms.ProducerQueueService;
import cn.believeus.jms.ProducerTopicService;
   
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration("/applicationContext.xml")  
public class ProducerConsumerTest {  
   
    @Resource  
    private ProducerQueueService producerQueueService;
    @Resource
    private ProducerTopicService producerTopicService;
    @Resource 
    private Destination queueDestination;
    @Resource
    private Destination topicDestination;
      
    @Test  
    public void testQueueSend() throws Exception {  
        while(true) {
            producerQueueService.sendMessage(queueDestination, "["+UUID.randomUUID()+"]");
            Thread.sleep(2000);
        }  
    }  
    /*mvn clean test -Dtest=cn.believeus.jms.test.ProducerConsumerTest#testQueueSend*/
    @Test  
    public void testTopicSend() throws Exception {  
        while(true) {  
        	producerTopicService.sendMessage(topicDestination, "["+UUID.randomUUID()+"]");
            Thread.sleep(2000);
        }  
    }  
}   