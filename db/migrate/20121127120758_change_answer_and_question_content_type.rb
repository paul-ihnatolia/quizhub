class ChangeAnswerAndQuestionContentType < ActiveRecord::Migration
  def up
    change_column :answers, :content, :text
    change_column :questions, :content, :text
  end

  def down
    change_column :answers, :content, :string
    change_column :questions, :content, :string
  end
end
