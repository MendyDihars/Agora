class CreateMendies < ActiveRecord::Migration[5.0]
  def change
    create_table :mendies do |t|
      t.integer :balance
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
