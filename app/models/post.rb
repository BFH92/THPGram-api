class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  #validates :image, :presence => true
  has_many :comments



end
