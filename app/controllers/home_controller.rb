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

  def add_roaster
  	player = Player.find(params["id"])
  	current_user.follow(player)

    respond_to do |format|
        format.html { redirect_to players_path, notice: 'Player added to Roaster list' }
    end
  end

  def add_follow
  	player = User.find(params["id"])
  	current_user.follow(player)

    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User added to followings list' }
    end
  end
end
