class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.text :bio

      t.timestamps
    end
  end
end
