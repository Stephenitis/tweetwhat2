class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def self.find_by_username(username)
    self.find_or_create_by_user_name(username)  
  end

  def screen_name
    @twitter_user.screen_name
  end


  def fetch_tweets!
    Twitter.user_timeline(self.user_name).each do |tweet|
      self.tweets << Tweet.find_or_create_by_text(:text => tweet.text)
    end
  end

  def tweets_stale?
    Time.now > (self.updated_at + 900)
  end
end
