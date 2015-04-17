class ItemsController < ApplicationController

    def edit
        Rails.logger.debug("-"*30)
        Rails.logger.debug("Params tiene: #{params}")
        Rails.logger.debug("-"*30)
        @list = List.find(params[:list_id])
        @item = Item.find(params[:id])
    end

    def update
        @list = List.find(params[:list_id])
        @item = Item.find(params.require(:id))
        if @item.update(secure_params)
            flash[:success] = "Item Updated"
            redirect_to list_path(@list)
        else
            render :edit
        end

    end

    def new
        @list = List.find(params[:list_id])
        @item = Item.new
    end

    def create
        @list = List.find(params[:list_id])
        @item=Item.new(secure_params)
        @item.list = @list

        Rails.logger.debug("-"*30)
        Rails.logger.debug("Es valido? - #{@item.valid?}")
        Rails.logger.debug("los errores son: #{@item.errors.messages}")
        Rails.logger.debug("-"*30)


        if @item.save
            flash[:success] = "New item created in #{@list.title} list"
            redirect_to list_path(@list)
        else
            render :new
        end
    end

    private

    def secure_params
        params.require(:item).permit(:content)
    end
end
