# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @posts = @group.posts
  end

  def show
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post_owner = @post.user
    @comments = @post.comments
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_params)
    @group = Group.find(params[:group_id])
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          # redirect_to user_group_posts_path(current_user, @group.id)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          redirect_to new_user_group_post_path(current_user)
        end
      end
    end
  end

  def edit
    @post = Post.find(params[:id])

    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :body))
      flash[:success] = 'Post item successfully updated!'
      # redirect_to user_group_post_path(@post)
    else
      flash.now[:error] = 'Post item update failed'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @user = current_user
    @user.save
    @group = Group.find(params[:group_id])
    @group.save
    respond_to do |format|
      format.html do
        flash[:success] = 'Post deleted successfully'

      end
    end
  end

  private

  def post_params
    params
      .require(:post)
      .permit(:title, :body)
      .merge(user_id: params[:user_id], group_id: params[:group_id])
  end
end
