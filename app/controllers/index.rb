get '/' do
  erb :index
end

get '/find/:user_name' do
p Twitter.user_timeline(params[:user_name]).last
end

post "/tweetfinder" do
  @user = TwitterUser.find_by_username(params[:user_name])
    if  @user.tweets.empty?
    @user.fetch_tweets!

  elsif @user.tweets_stale?
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)

erb :_user_tweets, :layout => false
end

post "/follow/finder" do

  @searches = Twitter.search(params[:user_name], :count => 10, :result_type => "recent").attrs
  # p searches
  erb :_sidebar, :layout => false

end

#added a comment
