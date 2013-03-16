class SectionsController < ApplicationController

  before_filter :parent_course
  
  def parent_course
    @course = Course.find(params[:course_id])
  end

  def new
    @section = @course.sections.build
  end
  
  def create
    @section = @course.sections.build(params[:section])
    @section.save
    @outline = Outline.where("course_id = ?", @course.id).all
    @outline.empty? ? i = 1 : i = @outline.sort_by {|x| x.order_number}.last.order_number += 1
    @content = Outline.new(:course_id => @course.id, :content_type => 'Section', :order_number => i, :content_id => @section.id)
    @content.save
    
    respond_to do |format|
      if @section.save
        format.html { redirect_to edit_course_path(@course), notice: 'Section was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def edit
    @section = Section.find(params[:id])
  end
  
  def update
    @section = Section.find(params[:id])
    flash[:notice] = "Section succsessfully updated."
    redirect_to edit_course_path(@course)
  end
  
  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    Outline.where("content_id = ? AND content_type = ?", @section.id, 'Section').first.destroy

    respond_to do |format|
      format.html { redirect_to edit_course_path(@course), notice: 'Section was successfully destroyed.' }
    end
  end
  
end
