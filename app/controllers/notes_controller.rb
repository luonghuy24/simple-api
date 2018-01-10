class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    @notes = current_user.notes.all
    json_response(@notes)
  end

  # POST /notes
  def create
    @note = current_user.notes.create!(note_params)
    json_response(@note, :created)
  end

  # GET /notes/:id
  def show
    json_response(@note)
  end

  # PUT /notes/:id
  def update
    @note.update(note_params)
    head :no_content
  end

  # DELETE /notes/:id
  def destroy
    @note.destroy
    head :no_content
  end

  private

  def note_params
    # whitelist params
    params.permit(:title, :content)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
