require 'java'
require 'view/todo_list_panel'

java_import java.awt.BorderLayout
java_import java.awt.Color
java_import java.awt.Dimension

java_import javax.swing.JButton
java_import javax.swing.JFrame
java_import javax.swing.JScrollPane

class MainFrame < JFrame
	
	attr_accessor :list
	
	def initialize
		super "Remind.me"
		self.setLayout BorderLayout.new
		self.setBackground Color::WHITE
		self.setDefaultCloseOperation JFrame::EXIT_ON_CLOSE
		self.setPreferredSize Dimension.new(300, 400)

		self.list = TodoListPanel.new
		self.getContentPane.add JScrollPane.new(@list), BorderLayout::CENTER
		
		updateButton = JButton.new "Refresh"
		self.getContentPane.add updateButton, BorderLayout::SOUTH
	end
end
