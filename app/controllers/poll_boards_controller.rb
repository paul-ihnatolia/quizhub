class PollBoardsController < ApplicationController
  # GET /poll_boards
  # GET /poll_boards.json
  def index
    @poll_boards = PollBoard.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @poll_boards }
    end
  end

  # GET /poll_boards/1
  # GET /poll_boards/1.json
  def show
    @poll_board = PollBoard.first
    @poll_categories = PollCategory.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poll_board }
    end
  end

  # GET /poll_boards/new
  # GET /poll_boards/new.json
  def new
    @poll_board = PollBoard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @poll_board }
    end
  end

  # GET /poll_boards/1/edit
  def edit
    @poll_board = PollBoard.find(params[:id])
  end

  # POST /poll_boards
  # POST /poll_boards.json
  def create
    @poll_board = PollBoard.new(params[:poll_board])

    respond_to do |format|
      if @poll_board.save
        format.html { redirect_to @poll_board, notice: 'Poll board was successfully created.' }
        format.json { render json: @poll_board, status: :created, location: @poll_board }
      else
        format.html { render action: "new" }
        format.json { render json: @poll_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /poll_boards/1
  # PUT /poll_boards/1.json
  def update
    @poll_board = PollBoard.find(params[:id])

    respond_to do |format|
      if @poll_board.update_attributes(params[:poll_board])
        format.html { redirect_to @poll_board, notice: 'Poll board was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poll_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_boards/1
  # DELETE /poll_boards/1.json
  def destroy
    @poll_board = PollBoard.find(params[:id])
    @poll_board.destroy

    respond_to do |format|
      format.html { redirect_to poll_boards_url }
      format.json { head :no_content }
    end
  end
end
