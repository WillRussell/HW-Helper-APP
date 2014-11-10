class ProblemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_problem, only: [:show, :destroy, :edit, :update]

  def home
  end

  def index
    @problems = Problem.all
  end

  def show
  end

  def new
    @problem = Problem.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to @problem, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem }
      else
        format.html { render :edit }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @problem = Problem.new
    @problem.update(problem_params)
    @problem.update(user: current_user)

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

  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url, notice: 'Problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:title, :description, :tried, :solved)
  end
end
