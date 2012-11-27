class AddOriginalListNumberToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :original_list_number, :integer
  end
end
