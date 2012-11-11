class UserAnswer < ActiveRecord::Base
  attr_accessible :question_id, :answer_id, :user_id, :attempt_no
  belongs_to :question
  belongs_to :answer
end
