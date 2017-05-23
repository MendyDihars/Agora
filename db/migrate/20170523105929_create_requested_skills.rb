class CreateRequestedSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :requested_skills do |t|
      t.references :user, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
