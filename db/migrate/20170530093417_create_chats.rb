class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.references :meeting, foreign_key: true
      t.references :student, references: :users, index: true
      t.references :teacher, references: :users, index: true
      t.text :content

      t.timestamps
    end
  end
end
