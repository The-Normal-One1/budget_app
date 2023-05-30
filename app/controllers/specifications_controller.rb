class SpecificationsController < ApplicationController

        load_and_authorize_resource

        def index
                @group = Group.find_by(user: current_user, id: params[:group_id])
                @specifications = @group.specifications
        end

        def new
                @specification = Specification.new
                @groups = Group.where(user: current_user)
        end

        def create
                @specification = Specification.new(specification_params)
                @groups = params[:groups]
                @groups.each do |id|
                        group = Group.find(id) unless id == ""
                        @specification.groups << group
                end
                @specification.author = current_user
                if @specification.save
                        redirect_to group_specifications_path, notice: "Specification was successfully created"
                else
                        render 'new'
                end
        end

        private 

        def specification_params
                params.require(:specification).permit(:name, :amount)

        end
end
