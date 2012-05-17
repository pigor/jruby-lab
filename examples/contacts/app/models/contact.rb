class Contact < ActiveRecord::Base
  attr_accessible :bio, :birthdate, :email, :name
end
