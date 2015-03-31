class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :replies
  validates :body, :presence => true


end
