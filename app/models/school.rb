class School < ActiveRecord::Base
  belongs_to :user
  has_many :pupils
end
