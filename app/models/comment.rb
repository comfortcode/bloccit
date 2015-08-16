class Comment < ActiveRecord::Base
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  
  belongs_to :post
  belongs_to :user
end
