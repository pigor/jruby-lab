#coding: utf-8
require 'java'
require 'java_socket'
require 'client_jruby'

class ClientConexion

	def initialize
		begin
			socket = JavaSocket::Socket.new "localhost", 1234

			puts "Conectando..."

			client = ClientJRuby.new(socket)
			Thread.new(client) do |chat|
			  chat.run
      end

  	rescue Exception => e
			puts "Ocorreu um erro #{e}"
		end
	end

end

ClientConexion.new
