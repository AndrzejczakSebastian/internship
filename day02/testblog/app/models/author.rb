class Author < ActiveRecord::Base
  validates :name, :surname, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 18 }


  has_many :comment
  has_many :author_post
  has_many :posts, through: :author_post
end
