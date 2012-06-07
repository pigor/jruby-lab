#coding: utf-8
require 'java'
require 'java_socket'
require 'client_jruby'

# include_class Java::Client

class ClientConexion
	
	def initialize
		begin
			socket = JavaSocket::Socket.new "localhost", 1234
			
			puts "Conectando..."
			
			chat = ClientJRuby.new(socket)
			Thread.new do
        chat.run
		  end
			
  	rescue Exception => e
			puts "Ocorreu um erro #{e}"
		end
	end
	
end

ClientConexion.new
