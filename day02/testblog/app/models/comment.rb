class Comment < ActiveRecord::Base
  validates :author_id, :post_id, :content, presence: true
  validates :content, uniqueness: true
  validates :content, length: { minimum: 5 }
end
