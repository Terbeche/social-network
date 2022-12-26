# frozen_string_literal: true

class CommentsController < ApplicationController
  helper_method :create_reply
  def new
    puts 'new comment'
    puts 'new comment'
    puts 'new comment'
    puts 'new comment'
    puts 'new comment'
    puts 'new comment'
    puts 'new comment'
    puts 'new comment'
    puts 'new comment'

    # @comment = Comment.new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(parent_id: params[:parent_id])
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
   @comment = Comment.new(comment_params)
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html do
        if @comment.save
          puts 'comment saved'
          flash[:success] = 'Comment saved successfully'
        else
          puts 'comment not saved'
          flash.now[:error] = 'Error: Comment could not be saved'
        end
      end
    end
  end

  def create_reply()
    @comment = Comment.new(comment_params)
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:post_id])
    @parent = Comment.find(params[:parent_id])
    @comment.parent = @parent
    respond_to do |format|
      format.html do
        if @comment.save
          puts 'comment saved'
          flash[:success] = 'Comment saved successfully'
        else
          puts 'comment not saved'
          flash.now[:error] = 'Error: Comment could not be saved'
        end
      end
    end

  end
  def edit
    @comment = Comment.find(params[:id])

    render :edit
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(params.require(:comment).permit(:text))
      flash[:success] = 'Comment successfully updated!'
      @post = @comment.post
      @group = @post.group
      redirect_to user_group_post_path(current_user, @group, @post)
    else
      flash.now[:error] = 'Post item update failed'
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @user = current_user
    @user.save
    @post = @comment.post
    @post.save
    @group = @post.group
    @group.save
    # respond_to do |format|
    # format.html { redirect_to user_group_posts_path(current_user, @group.id)}
    # end
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:text, :parent_id)
      .merge(user_id: params[:user_id], post_id: params[:post_id])
  end
end
