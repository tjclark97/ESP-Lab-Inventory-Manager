class CategoriesController < ApplicationController
  
  def edit
    if params[:categoryAction].to_s == "Add" && params[:categoryName] != ""
      Category.find_or_create_by(name: params[:categoryName].to_s)
    else
      category = Category.find_by(name: params[:categoryName].to_s)
      if category.present?
        category.destroy
      end
    end
    flash[:notice] = "Category list updated"
  end

  def add(categoryName)
    category = Category.find_or_create_by(name: categoryName)
    category
  end

  def remove(categoryName)
    Category.destroy_by(name: categoryName)
  end
end
