class GroupsController < ApplicationController

    def index
        @groups = Group.all
    end


  def show
    @group = Group.find(params[:id])
    @members = group.users.all
  end

  def new
    @group = Group.new
    respond_to do |format|
      format.html { render :new, locals: { group: @group } }
    end
  end

  def create
    @group = current_user.groups.new(group_params)
    if @recipe.save
      redirect_to user_group_path(@group.user_id, @group.id)
    else
      render :new
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
