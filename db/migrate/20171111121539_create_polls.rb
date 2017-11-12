class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :name
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
