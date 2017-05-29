class CreateMendies < ActiveRecord::Migration[5.0]
  def change
    create_table :mendies do |t|
      t.integer :balance
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
