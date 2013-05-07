get '/' do
  erb :index
end

# get '/:user_name' do
#   @user = TwitterUser.find_by_username(params[:user_name])
#   if  @user.tweets.empty?
#     @user.fetch_tweets!
#   elsif @user.tweets_stale?
#     p "the tweets be stale mannnn"
#     @user.fetch_tweets!
#   end
#   @tweets = @user.tweets.limit(10)
# erb :_user_tweets
# end

post "/tweetfinder" do
  p params
  @user = TwitterUser.find_by_username(params[:user_name])
    if  @user.tweets.empty?
    @user.fetch_tweets!

  elsif @user.tweets_stale?
    p "the tweets be stale mannnn"
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)

erb :_user_tweets, :layout => false
end

#added a comment
