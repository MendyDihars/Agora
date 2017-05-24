class RemoveUserSkillsToMeetings < ActiveRecord::Migration[5.0]
  def change
    remove_column :meetings, :user_skill_id
  end
end
