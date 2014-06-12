class User < ActiveRecord::Base
  has_many :surveys
  has_many :responses
  has_many :choices, through: :responses
end
