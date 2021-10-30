class Public::ItemsController < ApplicationController

  def index
    @items = Item.search(params[:search])
    @genres = Genre.all
  end

  def genre
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  private

  def item_params
    params.require(:item).permit(:genre_id)
  end

end
