class Comment < ApplicationRecord
  belongs_to :note
  validates_presence_of :content, :created_by
end
