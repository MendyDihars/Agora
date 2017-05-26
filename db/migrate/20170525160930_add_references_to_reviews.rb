class AddReferencesToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :meeting, foreign_key: true
  end
end
