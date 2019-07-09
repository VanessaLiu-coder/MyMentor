class Enrolment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_one :mentor
  accepts_nested_attributes_for :mentor
  
end
