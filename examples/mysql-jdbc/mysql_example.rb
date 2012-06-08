require 'java'
require 'mysql-jdbc.jar'

java_import java.sql.DriverManager
java_import java.sql.SQLException

begin
  Java::com.mysql.jdbc.Driver
  
  conn = DriverManager.get_connection "jdbc:mysql://127.0.0.1:3306/vota_prato_development?user=root"
  stmt = conn.create_statement
  
  rs = stmt.execute_query "select restaurante from restaurantes"
  
  while rs.next do
    puts rs.string "restaurante"
  end
  
  rs.close
  stmt.close
  conn.close
  
rescue ClassNotFoundException => e
  puts "ClassNotFoundException: #{e}"
rescue SQLException => e
  puts "SQLException: #{e}"
end

