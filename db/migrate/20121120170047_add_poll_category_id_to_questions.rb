class AddPollCategoryIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :poll_category_id, :integer
  end
end
