class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet
  validates :body, :presence => true
end
