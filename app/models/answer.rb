class Answer < ActiveRecord::Base
  attr_accessible :content, :right, :user_answer_id

  def isRight?
    right
  end

  def to_s
    "Answer id: #{id.to_s}, content: #{content}, right: #{right.to_s}"
  end
end
