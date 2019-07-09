class AddIsMentorToEnrolments < ActiveRecord::Migration[5.1]
  def change
    add_column :enrolments, :is_mentor, :boolean, :default => false
  end
end
