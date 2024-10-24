class Admin::ItemsController < ApplicationController
    before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]

    def show
       @item = Item.find(params[:id])
       
    end
   
    def index
      @items_all = Item.all
      @items =Item.page(params[:page]).per(10)
    end
  
    def new
    @items = Item.new
    end
    
    def create
    @item = Item.new(_params)
      if @item.save
        flash[:notice] = "商品情報を作成しました！"
         redirect_to item_path(@item.id)
      else
        flash[:notice] = "商品情報の作成に失敗しました！" 
        redirect_to new_admin_item_path
      end
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
       if @item.update(item_params)
        redirect_to admin_items_path(@item)
        flash[:notice] = "商品情報を更新しました！"
       else
        flash[:notice] = "商品情報の更新に失敗しました！"  
        redirect_to edit_admin_item_path(@item)
       end
    end



   private
   
    def item_params
      params.require(:item).permit(:genre_id, :name, :description, :price_without_tax, :image, :is_sales_status)
    end
  
 
end
