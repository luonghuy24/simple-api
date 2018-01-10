class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :todos, foreign_key: :created_by, :dependent => :destroy
  has_many :notes, foreign_key: :created_by, :dependent => :destroy
  has_many :comments, foreign_key: :created_by, :dependent => :destroy
  # Validations
  validates_presence_of :name, :email, :password_digest
end
