class PollCategory < ActiveRecord::Base

  attr_accessible :name, :poll_board_id, :multiple_answers
  has_many :questions
  belongs_to :poll_board

end
