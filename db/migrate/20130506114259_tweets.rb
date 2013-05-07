class Tweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.string :profile_image_url
      t.string :retweet_count
      t.string :favorite_count
      t.references :twitter_user
      t.timestamps
    end
  end
end
