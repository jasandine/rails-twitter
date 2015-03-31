class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.string :body

      t.timestamps
    end
  end
end
