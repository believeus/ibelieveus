package cn.believeus.jms.test;  

import org.apache.activemq.ActiveMQConnectionFactory;  

import javax.jms.*;  

/*对于订阅发布模式 当生成者生产5条数据之后 消费者这时候连接上来，是不会
 * 获取生产者已经生产的5条数据的。这种模式下，要获取生产者的全部数据，
 * 那么必须消费者要实时监听生产者生产的信息。但是数据可以被多个监听该生
 * 产者的消费者获取*/
public class TopicSubscriber {  
    public static void main(String[] args) throws JMSException {  
        ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("tcp://localhost:61616");  
        final Connection connection = factory.createConnection();  
        connection.start();  
          
        final Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);  
        Topic topic = session.createTopic("myTopic.messages");  

        MessageConsumer consumer = session.createConsumer(topic);  
        consumer.setMessageListener(new MessageListener() {  
            public void onMessage(Message message) {  
                TextMessage tm = (TextMessage) message;  
                try {  
                    System.out.println("Received message: " + tm.getText());  
                } catch (JMSException e) {  
                    e.printStackTrace();  
                }finally {
                    // 关闭释放资源
                    if (session != null) {
                        try {
							session.close();
						} catch (JMSException e) {
							e.printStackTrace();
						}
                    }
                    if (connection != null) {
                        try {
							connection.close();
						} catch (JMSException e) {
							e.printStackTrace();
						}
                    }
                }  
            }  
        });  
  
    }  
}  