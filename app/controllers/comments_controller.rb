class CommentsController < ApplicationController
  before_action :set_note
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /todos/:todo_id/items
  def index
    json_response(@note.comments)
  end

  # GET /todos/:todo_id/items/:id
  def show
    json_response(@comment)
  end

  # POST /todos/:todo_id/items
  def create
    @note.comments.create!(comment_params.merge({created_by: current_user.id.to_s}))
    json_response(@note, :created)
  end

  # PUT /todos/:todo_id/items/:id
  def update
    @comment.update(comment_params)
    head :no_content
  end

  # DELETE /todos/:todo_id/items/:id
  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.permit(:content, :created_by)
  end

  def set_note
    @note = Note.find(params[:note_id])
  end

  def set_comment
    @comment = @note.comments.find_by!(id: params[:id]) if @note
  end
end
