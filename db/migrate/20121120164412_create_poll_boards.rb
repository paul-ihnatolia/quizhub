class CreatePollBoards < ActiveRecord::Migration
  def change
    create_table :poll_boards do |t|

      t.timestamps
    end
  end
end
