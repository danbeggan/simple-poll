class CreateVoteRecords < ActiveRecord::Migration
  def change
    create_table :vote_records do |t|
      t.string :ip
      t.belongs_to :answer, index: true

      t.timestamps null: false
    end

    remove_column :answers, :votes
  end
end
