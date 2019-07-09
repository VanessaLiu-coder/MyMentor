class AddFinishedStudentToMentors < ActiveRecord::Migration[5.1]
  def change
    add_column :mentors, :finished_student, :integer
  end
end
