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
		
    self.setLayout BorderLayout.new
    self.setBackground Color::WHITE
    self.setBorder BorderFactory.createLineBorder(Color::GRAY)

    @gridBagLayout = GridBagLayout.new
    @constraints = GridBagConstraints.new

		@content = JPanel.new
		@content.setLayout @gridBagLayout
		
    buildComponent
	end
	
  def addMessage
    message = JTextArea.new
    message.setEditable(false);  
    message.setLineWrap(true);  
    message.setWrapStyleWord(true);  
    message.setFont(Font.new("SansSerif", Font::PLAIN, 12));
    message.setText(@ticket.message);
    
    @constraints.gridx = 0;
    @constraints.gridy = 1;
    @constraints.gridwidth = GridBagConstraints::REMAINDER;
    @constraints.anchor = GridBagConstraints::SOUTHWEST;
    @content.add(message, @constraints);
  end
  
  def addSignature
    usernameLabel = JLabel.new(@ticket.username);
    usernameLabel.setFont(Font.new("SansSerif", Font::BOLD, 12));
    
    @constraints.gridx = 0;
    @constraints.gridy = 0;
    @constraints.weightx = 1.0;
    @constraints.anchor = GridBagConstraints::WEST;
    @content.add(usernameLabel, @constraints);
  end
  
  def addEventDate
    dateLabel = JLabel.new(@ticket.show_time);
    dateLabel.setFont(Font.new("SansSerif", Font::PLAIN, 10));
    dateLabel.setForeground(Color::GRAY);
    
    @constraints.gridx = 1;
    @constraints.gridy = 0;
    @constraints.weightx = 0.0;
    @constraints.anchor = GridBagConstraints::EAST;
    @content.add(dateLabel, @constraints);
  end
  
  def buildComponent
    @constraints.fill = GridBagConstraints::BOTH;
    
    addSignature
    addEventDate
    addMessage
    
    checked = @ticket.status == TodoTicket::STATUS_TYPES[:done] ? true : false
    
    self.add @content, BorderLayout::CENTER
    self.add JCheckBox.new("", checked), BorderLayout::EAST
  end
end