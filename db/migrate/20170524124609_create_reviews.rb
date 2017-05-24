class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :teacher, references: :users, index: true
      t.references :student, references: :users, index: true
      t.references :skill, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
