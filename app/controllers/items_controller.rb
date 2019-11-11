class ItemsController < ApplicationController

  def item_params
    params.require(:item).permit(:category, :name, :quantity, :condition, :available, :description, :purchase_link)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @item = Item.find(id) # look up movie by unique ID
    @item.quantity = Item.get_item_quantity(@item.name)
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_categories = Item.get_categories
    @selected_categories = params[:categories] || Category.all.pluck(:name) || session[:category] 
    @sort_by = params[:sort_by] || session[:sort_by]
    
    session[:category] = @selected_categories
    #session[:sort_by] = @sort_by
    if params[:categories].present?
      categories = Category.where(name: params[:categories])
    else 
      categories = Category.all
    end
    
    @items = Item.with_categories(@selected_categories)
    #@items = @items.order(@sort_by)

    if params[:sort_by] != session[:sort_by]
      flash.keep
      redirect_to items_path sort_by: @sort_by
    end

    if params[:sort_by] == 'name' then @name_header = 'hilite' end
    if params[:sort_by] == 'category' then @category_header = 'hilite' end
  end

  def new 
    # default: render 'new' template
  end

  def create
    @item = Item.custom_create(item_params)
    flash[:notice] = "#{@item.name} was successfully created."
    redirect_to items_path
  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find params[:id]
    @item.update_attributes!(item_params)
    flash[:notice] = "#{@item.name} was successfully updated."
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item '#{@item.name}' deleted."
    redirect_to "/items/#{@item.name}/show_specific_item_list/#{@item.name}"
  end

  def show_specific_item_list
    @item_list = Item.specific_item_list(params[:name])
    @item_name = params[:name]
  end

  def get_item_quantity(itemName)
    Item.get_item_quantity(itemName).to_i
  end
  helper_method :get_item_quantity

  def check_in_check_out
    @item = Item.find params[:id]
    if params[:check_in].present?
      @item.update available: 1
    elsif params[:check_out]
      @item.update available: 0
    end
    redirect_to :back
  end

end