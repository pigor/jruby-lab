#coding: utf-8
require 'java'
require 'java_socket'

class ClientJRuby
  include JavaSocket::Runnable

	def initialize(socket)
		puts "Cliente inicializado..."
		@socket = socket
	end
	
	def run
		begin
		  chat = JavaSocket::Scanner.new(JavaSocket::System.in)
			input = JavaSocket::Scanner.new(@socket.input_stream)
			output = JavaSocket::PrintWriter.new(@socket.output_stream)
			
			puts "Iniciando chat..."
			while true do
				message = chat.next_line
				output.println "Eu: #{message}"
				output.flush
				
				if input.has_next
				  puts "#{input.next_line}"
			  end
			end
		rescue Exception => e
			puts "Erro na conexão - #{e}"
		end
	end
end