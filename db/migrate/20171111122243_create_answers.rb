class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :name
      t.integer :votes, default: 0, null: false
      t.belongs_to :poll, index: true

      t.timestamps null: false
    end
  end
end
