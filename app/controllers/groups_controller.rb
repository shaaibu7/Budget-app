class GroupsController < ApplicationController
  def index
    @group = Group.includes(:budgets).where(author_id: current_user.id)
  end

  def show
    @group = Group.includes(:budgets).find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.author_id = current_user.id

    if @group.save
      redirect_to user_groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
