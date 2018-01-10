class Note < ApplicationRecord
   # model association
  has_many :comments, dependent: :destroy

  # validations
  validates_presence_of :title, :created_by, :content
end
