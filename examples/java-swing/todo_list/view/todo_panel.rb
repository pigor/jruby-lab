require 'java'
require 'model/todo_ticket'

java_import java.awt.BorderLayout
java_import java.awt.Color
java_import java.awt.Font
java_import java.awt.GridBagConstraints
java_import java.awt.GridBagLayout

java_import javax.swing.BorderFactory
java_import javax.swing.JCheckBox
java_import javax.swing.JLabel
java_import javax.swing.JPanel
java_import javax.swing.JTextArea

class TodoPanel < JPanel

	attr_accessor :ticket

	def initialize ticket
    super

		@ticket = ticket

    self.set_layout BorderLayout.new
    self.set_background Color::WHITE
    self.set_border BorderFactory.createLineBorder(Color::GRAY)

    @grid_bag_layout = GridBagLayout.new
    @constraints = GridBagConstraints.new

		@content = JPanel.new
		@content.set_layout @grid_bag_layout

    build_component
	end

  def add_message
    message = JTextArea.new
    message.set_editable false
    message.set_line_wrap true
    message.set_wrap_style_word true
    message.set_font Font.new("SansSerif", Font::PLAIN, 12)
    message.set_text @ticket.message

    @constraints.gridx = 0;
    @constraints.gridy = 1;
    @constraints.gridwidth = GridBagConstraints::REMAINDER;
    @constraints.anchor = GridBagConstraints::SOUTHWEST;
    @content.add message, @constraints
  end

  def add_signature
    username_label = JLabel.new(@ticket.username)
    username_label.set_font Font.new("SansSerif", Font::BOLD, 12)

    @constraints.gridx = 0
    @constraints.gridy = 0
    @constraints.weightx = 1.0
    @constraints.anchor = GridBagConstraints::WEST
    @content.add username_label, @constraints
  end

  def add_event_date
    date_label = JLabel.new(@ticket.show_time);
    date_label.set_font Font.new("SansSerif", Font::PLAIN, 10)
    date_label.set_foreground Color::GRAY

    @constraints.gridx = 1
    @constraints.gridy = 0
    @constraints.weightx = 0.0
    @constraints.anchor = GridBagConstraints::EAST
    @content.add date_label, @constraints
  end

  def build_component
    @constraints.fill = GridBagConstraints::BOTH;

    add_signature
    add_event_date
    add_message

    checked = @ticket.status == TodoTicket::STATUS_TYPES[:done] ? true : false

    self.add @content, BorderLayout::CENTER
    self.add JCheckBox.new("", checked), BorderLayout::EAST
  end
end
