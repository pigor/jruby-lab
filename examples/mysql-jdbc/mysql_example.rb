require 'java'
require 'mysql-jdbc.jar'

java_import java.sql.DriverManager
java_import java.sql.SQLException

class MySQLExample
  def initialize
    begin
      Java::com.mysql.jdbc.Driver

      conn = DriverManager.get_connection "jdbc:mysql://127.0.0.1:3306/bizusafo_development", "root", ""
      stmt = conn.create_statement

      rs = stmt.execute_query "select text from comments"

      while rs.next do
        puts "Comment: " + rs.string("text")
      end

      rs.close
      stmt.close
      conn.close

    rescue SQLException => e
      puts "SQLException: #{e}"
    end 
  end
end

MySQLExample.new