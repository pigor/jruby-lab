require 'rubygems'
require 'jms'

# Connect to ActiveMQ
config = {
  :factory => 'org.apache.activemq.ActiveMQConnectionFactory',
  :broker_url => 'tcp://localhost:61616',
  :require_jars => ["~/Applications/apache-activemq-5.6.0/activemq-all-5.6.0.jar"]
}

JMS::Connection.session(config) do |session|
  session.consume(:queue_name => 'ExampleQueue', :timeout=>1000) do |message|
    p message
  end
end