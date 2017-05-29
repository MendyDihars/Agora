class AddValidateAtToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :validate_at, :date
  end
end
