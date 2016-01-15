package cn.believeus.jms.test;  

import org.apache.activemq.ActiveMQConnectionFactory;  

import javax.jms.*;  

/*对于订阅发布模式 当生成者生产5条数据之后 消费者这时候连接上来，是不会
 * 获取生产者已经生产的5条数据的。这种模式下，要获取生产者的全部数据，
 * 那么必须消费者要实时监听生产者生产的信息。但是数据可以被多个监听该生
 * 产者的消费者获取*/

public class TopicPublisher {  
    public static void main(String[] args) throws JMSException {  
        ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("tcp://localhost:61616");  
        Connection connection = factory.createConnection();  
        connection.start();  
          
        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);  
        Topic topic = session.createTopic("myTopic.messages");  

        MessageProducer producer = session.createProducer(topic);  
        producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);  
        
        int count=0;
        while(true) {  
            TextMessage message = session.createTextMessage();  
            message.setText((count++)+".message_" + System.currentTimeMillis());  
            producer.send(message);  
            System.out.println("Sent message: " + message.getText());  

            try {  
                Thread.sleep(2000);  
            } catch (InterruptedException e) {  
                e.printStackTrace(); 
                if (session != null) {
                    session.close();
                }
                if (connection != null) {
                    connection.close();
                }
            }

        }  
    }  
}  