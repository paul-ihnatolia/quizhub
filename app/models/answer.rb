class Answer < ActiveRecord::Base
  attr_accessible :content, :right, :user_answer_id

  def isRight?
    right
  end

  def to_s
    "Answer id: #{id.to_s}, content: #{content}, right: #{right.to_s}"
  end

  def eql? a
    self.id == a.id
  end

end
