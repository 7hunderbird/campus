class OutlinesController < ApplicationController
  def order
    i = 1
    params[:outline].each do |id|
      Outline.update_all({:order_number => i}, {:id => id})
      i += 1
    end
    render :nothing => true
  end
end
