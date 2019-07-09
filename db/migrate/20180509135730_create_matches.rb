class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.float :feedback
      t.references :mentor, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :if_finish

      t.timestamps
    end
  end
end
