class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :possible_answer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
