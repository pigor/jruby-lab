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
		self.set_layout BorderLayout.new
		self.set_background Color::WHITE
		self.set_default_close_operation JFrame::EXIT_ON_CLOSE
		self.set_preferred_size Dimension.new(300, 400)

		self.list = TodoListPanel.new
		self.get_content_pane.add JScrollPane.new(@list), BorderLayout::CENTER

		update_button = JButton.new "Refresh"
		self.get_content_pane.add update_button, BorderLayout::SOUTH
	end
end
