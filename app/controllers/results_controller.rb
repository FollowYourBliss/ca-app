# encoding: utf-8
class ResultsController < ApplicationController
  before_filter :set_locale, only: [:create, :new]
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
      descript = analyse.description
      @problems = descript.problems
      @text = descript.text
      @best_phrases = Hash[analyse.description.first_n]
      @nr_of_chars = descript.text_number_of_chars
      @nr_of_words = descript.text_number_of_words
      @nr_of_nodes = descript.nr_of_nodes
      @score = descript.score
      @plagiarism = descript.plagiarism
      @html = descript.text.to_s.force_encoding("UTF-8")
      @tags_problem = descript.tag_problem_flag
  end

  # PUT /results/1
  # PUT /results/1.json

  def set_locale
    I18n.locale = :pl
  end

  def update

  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy

  end
end
