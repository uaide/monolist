class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    if params[:q]
      response = Amazon::Ecs.item_search(params[:q] , 
                                  :search_index => 'All' , 
                                  :response_group => 'Medium' , 
                                  :country => 'jp')
      @amazon_items = response.items
    end
  end

  def show
    @titletag = @item.title + "-monolist"
    @descriptiontag = @item.title + "に関する情報です。この商品をほしい人、持ってる人を表示しています。"
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
