class UserAnswer < ActiveRecord::Base
  attr_accessible :question_id, :right, :user_id
end
