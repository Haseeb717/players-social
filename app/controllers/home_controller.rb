class HomeController < ApplicationController
  before_action :authenticate_user!, :only => [:add_roaster,:add_follow]
  
  def index
  end

  def user
    @user = User.find(params["id"])
  end

  def users
  	@users = User.all
  end

  def my_posts
  end

  def notifications
    @tags = TagUser.where('tag_id =? and tag_type =?',"#{current_user.id}","User").order('created_at desc')
  end

  def add_roaster
  	player = Player.find(params["id"])
  	current_user.follow(player)

    respond_to do |format|
      format.html { redirect_to players_path, notice: 'Player added to Roster list' }
    end
  end

  def add_follow
  	player = User.find(params["id"])
  	current_user.follow(player)
    
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User added to followings list' }
    end
  end

  def remove_roaster
    player = Player.find(params["id"])
    current_user.stop_following(player)

    respond_to do |format|
      format.html { redirect_to players_path, notice: 'Player removed from Roster list' }
    end
  end

  def remove_follow
    user = User.find(params["id"])
    current_user.stop_following(user)

    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User removed from followings list' }
    end
  end

  def policy
  end

  def terms
  end

  def search
    @query = params["query"]
    @users = User.where('lower(name) LIKE (?)',"%#{@query.downcase}%")

    @players = Player.where('lower(name) LIKE (?)',"%#{@query.downcase}%")
  end
end
