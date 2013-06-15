class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :description
      t.integer :teacher_id

      t.timestamps
    end
  end
end
