class Match < ApplicationRecord
  belongs_to :mentor
  belongs_to :user
  
  validate :if_collision,:on => :create
  def if_collision
    if Match.exists?(mentor_id: self.mentor_id, user_id: self.user_id)
      errors.add(:description, "invalid record")
    end 
  end 
end
