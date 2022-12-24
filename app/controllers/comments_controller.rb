class CommentsController < ApplicationController
    
    def new
        @comment = Comment.new
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
            puts "comment saved"
            flash[:success] = 'Comment saved successfully'
            redirect_to user_group_post_comments_path(current_user, @group, @post)
            else
            puts "comment not saved"
            flash.now[:error] = 'Error: Comment could not be saved'
            redirect_to new_user_group_post_comment_path(current_user)
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
            puts "comment updated"
            puts "comment updated"
            puts "comment updated"
            puts "comment updated"
            flash[:success] = "Comment successfully updated!"
            @post = @comment.post
            @group = @post.group
            redirect_to user_group_post_path(current_user, @group, @post)
        else
            flash.now[:error] = "Post item update failed"
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
        .permit(:text)
        .merge(user_id: params[:user_id], post_id: params[:post_id], parent_id: params[:parent_id])
    end

end
