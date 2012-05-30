require 'rubygems'
require 'jms'

# Connect to ActiveMQ
config = {
  :factory => 'org.apache.activemq.ActiveMQConnectionFactory',
  :broker_url => 'tcp://localhost:61616',
  :require_jars => [
    "~/Applications/apache-activemq-5.6.0/activemq-all-5.6.0.jar",
    "~/Applications/apache-activemq-5.6.0/lib/optional/slf4j-log4j12-1.6.4.jar",
    "~/Applications/apache-activemq-5.6.0/lib/optional/log4j-1.2.16.jar"
  ]
}

JMS::Connection.session(config) do |session|
  session.producer(:queue_name => 'ExampleQueue') do |producer|
    producer.send(session.message("Hello JRuby"))
  end
end