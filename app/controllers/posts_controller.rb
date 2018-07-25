class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:new,:create,:edit,:update]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    tags = post_params["description"].scan(/#\w+/)
    mentions = post_params["description"].scan(/@\w+/)
    valid_users = []
    valid_players = []
    tags.each do |tag|
      post_params["description"].slice! tag
    end

    mentions.each do |mention|
      vp = mention[1..-1]
      user = User.find_by_name(vp)
      if user
        valid_users << user
        post_params["description"].slice! mention
      else
        player = Player.find_by_name(vp)
        if player
          valid_players << player
          post_params["description"].slice! mention
        end
      end
    end

    respond_to do |format|
      if @post.save!
        tags.each do |tag|
          Tag.create(:post_id=>@post.id,:title=>tag)
        end
        valid_players.each do |player|
          TagUser.create(:post_id=>@post.id,:tag_id=>player.id,:tag_type=>"Player")
        end
        valid_users.each do |user|
          TagUser.create(:post_id=>@post.id,:tag_id=>user.id,:tag_type=>"User")
        end
        format.html { redirect_back fallback_location: root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title,:description,:image,:user_id,:another_user_id,:player_id)
    end
end
