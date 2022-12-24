class MembersController < ApplicationController
    def create
        
    
        @member = Member.new()
        @group = Group.find(params[:group_id])
        @member.group = @group
        @member.user = current_user
        respond_to do |format|
          format.html do
            if @member.save
            #   redirect_to user_group_path(current_user, @group.id), notice: 'Group joined successfully'
            else
            #   redirect_to user_group_path(current_user, @group.id), alert: 'Error, Group not joined!'
            end
          end
        end
      end
    
      def destroy
        @group = Group.find(params[:group_id])
        @member = Member.includes(:user, :group).find(params[:id])
        @member.delete
    
        respond_to do |format|
          format.html do
            redirect_to user_group_path(current_user, @group.id), notice: 'Group joined successfully'
          end
        end
      end
 

end
