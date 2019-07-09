class CreateMentors < ActiveRecord::Migration[5.1]
  def change
    create_table :mentors do |t|
      t.references :enrolment, foreign_key: true
      t.float :hourly_rate
      t.float :review

      t.timestamps
    end
  end
end
