class Mentor < ApplicationRecord
  belongs_to :enrolment
  has_many :matches
  
  validate :if_collision,:on => :create
  validates :enrolment_id, presence: true
  def if_collision
    if self.enrolment_id != nil
      if Enrolment.exists?(user_id: Enrolment.find(self.enrolment_id).user_id, course_id: Enrolment.find(self.enrolment_id).course_id, is_mentor: true)
        errors.add(:description, "invalid record")
      end 
      if Enrolment.exists?(user_id: Enrolment.find(self.enrolment_id).user_id, course_id: Enrolment.find(self.enrolment_id).course_id, year: Date.today.year)
        errors.add(:description, "invalid record")
      end 
    end
  end 
end
