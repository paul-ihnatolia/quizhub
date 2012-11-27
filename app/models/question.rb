class Question < ActiveRecord::Base

  attr_accessible :content, :poll_category_id, :original_list_number
  has_many :answers
  belongs_to :poll_category

  def to_s
    "Question id=#{self.id.to_s} content: #{content.to_s} poll_category_id : #{poll_category_id.to_s}, original list number : #{original_list_number.to_s}"
  end
end
