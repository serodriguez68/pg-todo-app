class ListsController < ApplicationController

    before_action :find_list, only: [:show, :edit, :update, :destroy]

    def index

        @lists = List.all.order('id')

    end

    def show

    end

    def new
        @list = List.new
    end

    def create
        Rails.logger.debug("-"*30)
        Rails.logger.debug("Entering Create action")
        Rails.logger.debug("-"*30)

        @list = List.new(secure_params)

        if @list.save
            flash[:success] = "New list #{@list.title} created"
            redirect_to root_path
        else
            render :new
        end
    end

    def edit

    end

    def update
        Rails.logger.debug("-"*30)
        Rails.logger.debug("Entering Update action")
        Rails.logger.debug("-"*30)

        if @list.update(secure_params)
            flash[:success] = "List #{@list.title} Updated"
            redirect_to root_path
        else
            render :edit
        end


    end

    def destroy
        @list.destroy
        flash[:success] = "List #{@list.title} Deleted"
        redirect_to root_path
    end

    private

    def find_list
        @list=List.find(params[:id])
    end

    def secure_params
        params.require(:list).permit(:title, :description)
    end


end
