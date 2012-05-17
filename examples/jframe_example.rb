require 'java'

frame = javax.swing.JFrame.new("Window")
label = javax.swing.JLabel.new("Hello")

frame.setLayout(java.awt.FlowLayout.new(java.awt.FlowLayout::CENTER))
frame.getContentPane.add(label)
frame.setDefaultCloseOperation(javax.swing.JFrame::EXIT_ON_CLOSE)
frame.setMinimumSize(java.awt.Dimension.new(200,200))
frame.pack
frame.setVisible(true)