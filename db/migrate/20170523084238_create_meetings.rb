class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.references :teacher, references: :users, index: true
      t.references :user_skill, foreign_key: true
      t.references :student, references: :users, index: true
      t.date :happen_at
      t.text :message
      t.date :approved_at
      t.date :rejected_at

      t.timestamps
    end
  end
end
