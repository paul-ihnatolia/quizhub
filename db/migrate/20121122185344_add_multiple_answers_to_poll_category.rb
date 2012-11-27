class AddMultipleAnswersToPollCategory < ActiveRecord::Migration
  def change
    add_column :poll_categories, :multiple_answers, :boolean, default: false
  end
end
