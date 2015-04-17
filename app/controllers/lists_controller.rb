class ListsController < ApplicationController

    def index

        @lists = List.all.order('id')

    end

    def show
        @list = List.find(params.require(:id))
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
        @list = List.find(params.require(:id))
    end

    def update
        Rails.logger.debug("-"*30)
        Rails.logger.debug("Entering Update action")
        Rails.logger.debug("-"*30)


        @list = List.find(params.require(:id))
        if @list.update(secure_params)
            flash[:success] = "List #{@list.title} Updated"
            redirect_to root_path
        else
            render :edit
        end


    end

    def destroy
        @list=List.find(params[:id])
        @list.destroy
        flash[:success] = "List #{@list.title} Deleted"
        redirect_to root_path
    end

    private

    def secure_params
        params.require(:list).permit(:title, :description)
    end


end
