require 'java'
require 'view/todo_panel'

java_import java.awt.Color;
java_import java.awt.Component;

java_import javax.swing.BoxLayout;
java_import javax.swing.JPanel;

class TodoListPanel < JPanel
  def initialize
    super
		self.set_layout BoxLayout.new(self, BoxLayout::Y_AXIS)
		self.set_background Color::WHITE
		self.set_alignment_x Component::CENTER_ALIGNMENT
	end
	
	def addToDo(panel)
    self.add panel
	end
end