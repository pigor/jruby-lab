require 'java'

java_import java.text.SimpleDateFormat

class TodoTicket

  STATUS_TYPES = {
    requested: "REQUESTED",
    pending: "PENDING",
    done: "DONE"
  }
  
  attr_accessor :message, :username, :status, :created_at, :updated_at
  
  def initialize(message, username, status, created_at = Time.now, updated_at = Time.now)
    self.message = message
    self.username = username
    self.status = status
    self.created_at = created_at
    self.updated_at = updated_at
  end
  
  def show
    "'#{self.message}' por #{self.username} em #{show_time} [#{self.status}]"
  end
  
  def show_time
    SimpleDateFormat.new("dd/MM/yyyy").format(self.updated_at)
  end
end