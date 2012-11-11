class ChangeUserAnswers < ActiveRecord::Migration
  def up
    change_table :user_answers do |ua|
      ua.remove :right
      ua.integer :answer_id
    end
  end

  def down
    change_table :users_answer do |ua|
      ua.boolean :right
      ua.remove :answer_id
    end
  end
end
