class MaterialsController < ApplicationController
  
  before_filter :parent_course
  
  def parent_course
    @course = Course.find(params[:course_id])
  end

  def new
    @material = @course.materials.build
  end
  
  def create
    @material = @course.materials.build(params[:material])
    @material.save
    @outline = Outline.where("course_id = ?", @course.id).last.try(:order_number)
    if @outline.nil?
      i = 0
    else
      i = @outline
    end
    i += 1
    @content = Outline.new(:course_id => @course.id, :content_type => 'Material', :order_number => i, :content_id => @material.id)
    @content.save
    
    respond_to do |format|
      if @material.save
        format.html { redirect_to course_path(@course), notice: 'Material was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def edit
    @material = Material.find(params[:id])
  end
  
  def update
    @material = Material.find(params[:id])

    respond_to do |format|
      if @material.update_attributes(params[:material])
        format.html { redirect_to course_path(@course), notice: 'Material was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    Outline.where("content_id = ? AND content_type = ?", @material.id, 'Material').first.destroy

    respond_to do |format|
      format.html { redirect_to @course, notice: 'Material was successfully destroyed.' }
    end
  end
  
end
