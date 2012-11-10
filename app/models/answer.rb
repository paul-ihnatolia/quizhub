class Answer < ActiveRecord::Base
  attr_accessible :content, :right

  def isRight?
    right
  end

end
