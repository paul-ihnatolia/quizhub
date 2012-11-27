class PollCategoriesController < ApplicationController
  # GET /poll_categories
  # GET /poll_categories.json
  def index
    @poll_categories = PollCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @poll_categories }
    end
  end

  # GET /poll_categories/1
  # GET /poll_categories/1.json
  def show
    @poll_category = PollCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poll_category }
    end
  end

  # GET /poll_categories/new
  # GET /poll_categories/new.json
  def new
    @poll_category = PollCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @poll_category }
    end
  end

  # GET /poll_categories/1/edit
  def edit
    @poll_category = PollCategory.find(params[:id])
  end

  # POST /poll_categories
  # POST /poll_categories.json
  def create
    @poll_category = PollCategory.new(params[:poll_category])

    respond_to do |format|
      if @poll_category.save
        format.html { redirect_to @poll_category, notice: 'Poll category was successfully created.' }
        format.json { render json: @poll_category, status: :created, location: @poll_category }
      else
        format.html { render action: "new" }
        format.json { render json: @poll_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /poll_categories/1
  # PUT /poll_categories/1.json
  def update
    @poll_category = PollCategory.find(params[:id])

    respond_to do |format|
      if @poll_category.update_attributes(params[:poll_category])
        format.html { redirect_to @poll_category, notice: 'Poll category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poll_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_categories/1
  # DELETE /poll_categories/1.json
  def destroy
    @poll_category = PollCategory.find(params[:id])
    @poll_category.destroy

    respond_to do |format|
      format.html { redirect_to poll_categories_url }
      format.json { head :no_content }
    end
  end
end
