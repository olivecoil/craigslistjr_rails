class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.create(item_params)
    redirect_to category_path(@category)
  end

  private
    def item_params
      params.require(:item).permit(:title,:price,:email)
    end
end
