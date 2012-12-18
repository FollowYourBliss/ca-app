
class ResultsController < ApplicationController

  # GET /results
  # GET /results.json
  def index
  end

  # GET /results/1
  # GET /results/1.json
  def show

  end

  # GET /results/new
  # GET /results/new.json
  def new
    puts " ania kokokokokokokokok"
  end

  # GET /results/1/edit
  def edit

  end

  # POST /results
  # POST /results.json
  def create
    if params[:sample]
      analyse = Ca::Analyse.new(HTMLReader.instance.page(params[:sample][:address]));
    end
    if params[:text]
      analyse = Ca::Analyse.new(params[:text][:content]);
    end

      @problems = analyse.description.problems
      @text = analyse.description.text
  end

  # PUT /results/1
  # PUT /results/1.json
  def update

  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy

  end
end
