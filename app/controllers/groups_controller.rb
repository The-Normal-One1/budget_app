class GroupsController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Group.all.where(user_id: current_user.id).includes(:specifications)
  end

  def new
    @categorie = Group.new
  end

  def create
    @categorie = Group.new(group_params)
    @categorie.user_id = current_user.id
    if @categorie.save
      redirect_to groups_path, notice: 'Category was successfully created'
    else
      render 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
