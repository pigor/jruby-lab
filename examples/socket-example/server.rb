#coding: utf-8
require 'java'
require 'java_socket'
require 'client_jruby'

class Server
  
	def initialize
		begin 
			server = JavaSocket::ServerSocket.new 1234
			puts "Aguardando conexão..."
		
			while true do									
				socket = server.accept
				
				puts "Cliente conectado: #{socket.local_address.host_name}"
				
				Thread.new do
				  ClientJRuby.new(socket).run
			  end
			end
			 
	  rescue Exception => e
			puts "Ocorreu um erro #{e}"
		end
	end
end

Server.new