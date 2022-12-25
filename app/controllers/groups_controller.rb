class GroupsController < ApplicationController
    helper_method :check_if_member

    # <% member_users_id = [] %>
    # <% group.members.each do |member| %>
    #     <% member_users_id.push(member.user_id) %>
    # <%end %>


    #   <% if current_user.id == group.user_id %>
    #        <%= render 'own', {group: group, member: current_user} %>
    #        <% break %>
    #   <% end %>
    #    <% if  member_users_id.include? current_user.id %>
    #       <% member = Member.where("user_id = ? AND group_id = ?", current_user.id, group.id) %>
    #        <%= render 'leave', {group: group, member: member} %>
    #     <% else %>
    #       <%= render 'join', group: group %>
    #   <% end %>

   def check_if_member(group)
      @group = group 
      @member = Member.where(user_id: current_user.id, group_id: @group.id).first
      
      if @member
        return [true, @member]
      else
        return [false, @member]
      end
    end


    def index
        @groups = Group.all        
    end


    def show
      @group = Group.find(params[:id])
      @posts = @group.posts
    end

    def new
      @group = Group.new
      respond_to do |format|
        format.html { render :new, locals: { group: @group } }
      end
    end

    def create
    
      @group = Group.new(group_params)
  

      respond_to do |format|
          format.html do
            if @group.save
              flash[:success] = 'Group created successfully'
              redirect_to user_group_path(current_user, @group)
            else
              flash.now[:error] = 'Error: Group could not be created'
              redirect_to new_user_group_path(current_user)
            end
          end
        end
        membersController = MembersController.new
        membersController.request = request
        membersController.response = response
        membersController.create_admin(@group)
    end

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_post_path(current_user, @post)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          redirect_to new_user_post_path(current_user)
        end
      end
    end

  def destroy
    @group = Group.find params[:id]
    @group.destroy
    redirect_to user_group_path(@group.user_id)
  end



  private

  def group_params
    params
      .require(:group)
      .permit(:name)
      .merge(user_id: params[:user_id])
  end

end
