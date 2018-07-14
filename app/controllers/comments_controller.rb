class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /Comments
  # GET /Comments.json
  def index
    @comments = Comment.all
  end

  # GET /Comments/1
  # GET /Comments/1.json
  def show
  end

  # GET /Comments/new
  def new
    @comment = Comment.new
  end

  # GET /Comments/1/edit
  def edit
  end

  # Comment /Comments
  # Comment /Comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save!
        format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Comments/1
  # PATCH/PUT /Comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Comments/1
  # DELETE /Comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:description,:user_id,:post_id)
    end
end
