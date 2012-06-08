require 'java'

java_import java.awt.FlowLayout
java_import javax.swing.JFrame
java_import javax.swing.JLabel
java_import java.awt.Dimension


frame = JFrame.new("Window")
label = JLabel.new("Hello")

frame.set_layout FlowLayout.new(FlowLayout::CENTER)
frame.default_close_operation = JFrame::EXIT_ON_CLOSE
frame.minimum_size = Dimension.new 200, 200

frame.content_pane.add label

frame.pack
frame.visible = true