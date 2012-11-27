class PollCategory < ActiveRecord::Base

  attr_accessible :name, :poll_board_id
  has_many :questions
  belongs_to :poll_board

end
