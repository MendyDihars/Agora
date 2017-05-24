class AddSkillToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_reference :meetings, :skill, foreign_key: true
  end
end
