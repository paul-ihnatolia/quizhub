class AddAttemptNoToUserAnswers < ActiveRecord::Migration
  def change
    add_column :user_answers, :attempt_no, :integer
  end
end
