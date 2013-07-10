class SearchController < ApplicationController

  respond_to :js

  def search
    if !params[:query].blank?
      params[:search] = {:name_contains => params[:query]}
      @courses = Course.search(params[:search]).all.sort_by {|t| t.name}.first(5)
      render 'search'
    else
      render 'clear'
    end
  end

end