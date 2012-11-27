class UserAnswer < ActiveRecord::Base
  attr_accessible :question_id, :answer_id, :user_id, :attempt_no, :right
  belongs_to :question
  has_many :answer
end
