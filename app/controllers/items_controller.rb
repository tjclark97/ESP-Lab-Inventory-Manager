class ItemsController < ApplicationController

  def item_params
    params.require(:item).permit(:category, :name, :quantity, :condition, :available, :description, :purchase_link)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @item = Item.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_categories = Item.get_categories
    @selected_categories = params[:category] || session[:category] || @all_categories
    @sort_by = params[:sort_by] || session[:sort_by]
    
    session[:category] = @selected_categories
    session[:sort_by] = @sort_by

    @items = Item.with_categories(@selected_categories.keys)
    @items = @items.order(@sort_by)

    if params[:category] != session[:category] or params[:sort_by] != session[:sort_by]
      flash.keep
      redirect_to items_path sort_by: @sort_by, category: @selected_categories
    end

    if params[:sort_by] == 'name' then @name_header = 'hilite' end
    if params[:sort_by] == 'category' then @category_header = 'hilite' end
  end

  def new
    # default: render 'new' template
  end

  def create
    @item = Item.create!(item_params)
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
    redirect_to items_path
  end

end