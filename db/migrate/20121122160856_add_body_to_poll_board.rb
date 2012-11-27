class AddBodyToPollBoard < ActiveRecord::Migration
  def change
    add_column :poll_boards, :body, :string
  end
end
