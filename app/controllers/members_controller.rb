# frozen_string_literal: true

class MembersController < ApplicationController
  def create
    @member = Member.new
    @group = Group.find(params[:group_id])
    @member.group = @group
    @member.user = current_user
    @member.name = current_user.name
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

  def create_admin(group)
    @member = Member.new
    @group = group
    @member.group = @group
    @member.user = current_user
    @member.name = current_user.name
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
    puts 'destroying member'
    puts 'destroying member'
    puts 'destroying member'
    puts 'destroying member'
    puts 'destroying member'
    puts 'destroying member'
    puts 'destroying member'
    puts 'destroying member'
    puts 'destroying member'
    puts 'destroying member'

    @group = Group.find(params[:group_id])
    @member = Member.includes(:user, :group).find(params[:id])
    @member.delete

    respond_to do |format|
      format.html do
      end
    end
  end
end
