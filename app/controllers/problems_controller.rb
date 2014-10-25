class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show]

  def index
    @problems = Problem.all
  end

  def show
  end

  def new
  @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)

    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'problem was successfully created.' }
        format.json { render :index, status: :created, location: @problem }
      else
        format.html { render :new }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_problem
    @problem = Problem.find(params[:id])
  end


  def problem_params
    params.require(:problem).permit(:title, :description)
  end

end
