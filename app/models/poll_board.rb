class PollBoard < ActiveRecord::Base
  attr_accessible :body
  has_many :poll_categories
end
