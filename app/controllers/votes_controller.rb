class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @hold_date = Speech.last.hold_date
    @speech = Speech.last
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote1 = Vote.new
    @vote2 = Vote.new

    @vote1.hold_date = @vote2.hold_date =  Speech.first.hold_date
    @vote1.presenter = params[:vote][:presenter1]
    @vote2.presenter = params[:vote][:presenter2]
    @vote1.score = params[:vote][:score1]
    @vote2.score = params[:vote][:score2]
    @vote1.comment = params[:vote][:comment1]
    @vote2.comment = params[:vote][:comment2]

    if @vote1.save && @vote2.save
      redirect_to root_path
    else
      flash.now[:danger] = @vote1.errors ? @vote1.errors : @vote2.errors
      @hold_date = Speech.last.hold_date
      @speech = Speech.last
      render new_vote_path
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:hold_date, :presenter, :score, :comment)
    end
end
