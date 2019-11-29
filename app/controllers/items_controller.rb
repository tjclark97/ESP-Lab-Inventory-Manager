class ItemsController < ApplicationController

  def item_params
    params.require(:item).permit(:category, :name, :quantity, :condition, :available, :description, :purchase_link, :serial)
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
    if params[:categories].present? && params[:categories] != "All"
      categories = Category.where(name: params[:categories])
    else 
      categories = Category.all
    end
    
    
    # get the items to display from selected categories
    if (params[:cat].to_s == "All") || !params[:cat].present? then 
      @items = Kaminari.paginate_array(Item.with_categories(Category.all.pluck(:name))).page(params[:page]).per(10)
    else 
      @items = Kaminari.paginate_array(Item.with_categories(params[:cat].to_s)).page(params[:page]).per(10)
    end
    
    flash[:notice] = "Item list was filtered by #{params[:cat].to_s}."
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
    Item.destroy(params[:id])
    flash[:notice] = "Item '#{params[:name]}' deleted."
    redirect_to :back
  end

  def show_specific_item_list
    @item_list = Item.specific_item_list(params[:name]).page(params[:page]).per(10)
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
