class SpecificationsController < ApplicationController

  def index
    @group = Group.find_by(user: current_user, id: params[:group_id])
    @specifications = @group.specifications
  end

  def new
    @specification = current_user.specifications.build
    @groups = current_user.groups
  end
  
  def create
    @specification = current_user.specifications.build(specification_params)
    @groups = params[:groups]
    @groups.each do |id|
      group = current_user.groups.find(id) unless id == ''
      @specification.groups << group
    end
    if @specification.save
      redirect_to group_specifications_path, notice: 'Specification was successfully created'
    else
      render 'new'
    end
  end
  
  private

  def specification_params
    params.require(:specification).permit(:name, :amount)
  end
end
