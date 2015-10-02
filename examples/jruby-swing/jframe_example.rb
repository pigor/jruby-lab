require 'java'

java_import java.awt.FlowLayout
java_import javax.swing.JFrame
java_import javax.swing.JLabel
java_import javax.swing.JButton
java_import java.awt.Dimension

class SwingApp
  attr_accessor :description, :jframe, :label, :button

  def initialize
    @description = "Hello World Swing!"
    
    @frame = JFrame.new "JRuby Swing"
    @label = JLabel.new @description
    @button = JButton.new "JRuby Way!"
    @button.add_action_listener do |e|
      button_action
    end

    @frame.layout = FlowLayout.new(FlowLayout::CENTER)
    @frame.default_close_operation = JFrame::EXIT_ON_CLOSE
    @frame.minimum_size = Dimension.new 100, 100

    @frame.content_pane.add label
    @frame.content_pane.add button

    @frame.pack
    @frame.visible = true
  end

  def button_action
    if @description == @label.get_text
      @label.set_text "Hello World Swing with JRuby!"
      @button.set_text "Java Way!"
    else
      @label.set_text "Hello World Swing!"
      @button.set_text "JRuby Way!"
    end
  end
end

SwingApp.new
