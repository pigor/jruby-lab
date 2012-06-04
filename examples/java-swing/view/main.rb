require 'java'
require 'view/main_frame'
require 'view/todo_panel'
require 'view/todo_list_panel'

frame = MainFrame.new

frame.list.addToDo TodoPanel.new(TodoTicket.new("Teste Teste Teste Teste Teste Teste Teste Teste Teste", "pigor", TodoTicket::STATUS_TYPES[:required]))
frame.list.addToDo TodoPanel.new(TodoTicket.new("Teste1", "pigor", TodoTicket::STATUS_TYPES[:required]))
frame.list.addToDo TodoPanel.new(TodoTicket.new("Teste2", "pigor", TodoTicket::STATUS_TYPES[:required]))
frame.list.addToDo TodoPanel.new(TodoTicket.new("Teste3", "pigor", TodoTicket::STATUS_TYPES[:done]))

frame.pack
frame.setVisible true