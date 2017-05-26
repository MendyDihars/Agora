class AddApprovedMessageToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :approved_message, :text
  end
end
