class RemoveReferencesToReviews < ActiveRecord::Migration[5.0]
  def change
    remove_reference :reviews, :skill, foreign_key: true
  end
end
