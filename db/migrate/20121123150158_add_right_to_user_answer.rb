class AddRightToUserAnswer < ActiveRecord::Migration
  def change
    add_column :user_answers, :right, :boolean, default: true
  end
end
