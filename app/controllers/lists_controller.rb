class ListsController < ApplicationController

    def index
        Rails.logger.debug "-"*30
        Rails.logger.debug "DEBUG: entering index method"
        Rails.logger.debug "-"*30

        @lists = List.all

        Rails.logger.debug "-"*30
        Rails.logger.debug "DEBUG: List.all #{List.all}"
        Rails.logger.debug "-"*30
    end

    def show
    end

    def new
        @list = List.new
    end

    def create
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
    end

    def destroy
    end

    private

    def secure_params
        params.require(:list).permit(:title, :description)
    end


end
