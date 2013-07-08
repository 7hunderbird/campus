class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index    
    @items = Item.all
    @library_id = params[:library_id]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @library_id = params[:library_id]
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    @library_id = params[:library_id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    @library_id = params[:library_id]    
  end

  # POST /items
  # POST /items.json
  def create    
    @item = Item.new(params[:item])
    @library_id = @item.library_id

    respond_to do |format|
      if @item.save
        format.html { redirect_to library_items_path(@library_id), notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])
    @library_id = @item.library_id

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to library_items_path(@library_id), notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @library_id = @item.library_id
    @item.destroy

    respond_to do |format|
      format.html { redirect_to library_items_path(@library_id) }
      format.json { head :no_content }
    end
  end
end
