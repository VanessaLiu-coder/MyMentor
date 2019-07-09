class CreateEnrolments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrolments do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :year
      t.boolean :mentor

      t.timestamps
    end
  end
end
