class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]

  def new
    @note = Note.new
  end

  def create
    @problem = Problem.find(params[:problem_id])
    @note = @problem.notes.build(note_params)
    @note.user = current_user

    respond_to do |format|
      format.html do
        if @note.save
<<<<<<< HEAD
          redirect_to problem_path(@problem), notice: 'Note was successfully created.'
          send_email
        else
          render :new
=======
          redirect_to @problem
        else
          render 'problems/show'
>>>>>>> 58c4b9252aa69af4c3c8195e9ea18a5e9182f0ec
        end
      end

      format.js do
        if @note.save
          render :create, status: :created
        else
          render nothing: true, status: :bad_request
        end
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

  def send_email
    EventMailer.event_mail(current_user).deliver # FIXME this should be the user who owns the problem, not current_user
  end
end
