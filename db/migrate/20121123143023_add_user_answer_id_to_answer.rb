class AddUserAnswerIdToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :user_answer_id, :integer
  end
end
