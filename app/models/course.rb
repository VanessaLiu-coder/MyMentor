class Course < ApplicationRecord
	has_many :enrolments
	has_many :users, through: :enrolments
	has_many :mentors, through: :enrolments
end
