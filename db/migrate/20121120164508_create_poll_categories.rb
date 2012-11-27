class CreatePollCategories < ActiveRecord::Migration
  def change
    create_table :poll_categories do |t|
      t.string :name
      t.integer :poll_board_id
      t.timestamps
    end
  end
end
