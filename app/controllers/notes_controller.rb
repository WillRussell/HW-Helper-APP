class NotesController < ApplicationController
before_action :set_note, only: [:show, :edit, :update, :destroy]

  def new
    @note = Note.new
  end

  def create
    @problem = Problem.find(params[:problem_id])
    @note = @problem.notes.create(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to problem_path(@problem), notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

def destroy
  @problem = Problem.find(params[:problem_id])
  @note = @problem.notes.find(params[:id])
  @note.destroy
  respond_to do |format|
    format.html { redirect_to problem_path(@problem), notice: 'Item was successfully destroyed.' }
    format.json { head :no_content }
  end
end

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:body, :problem_id)
  end

end
