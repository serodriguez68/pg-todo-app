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

    private

    def secure_params
        params.require(:item).permit(:content)
    end
end
