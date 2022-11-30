class MusicSessionsController < ApplicationController
  def index
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    @session.user = current_user
    if @session.save
      redirect_to session_path(@session)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def duplicate
  end

  private

  def session_params
    params.require(:session).permit(:name, :category, :description)
  end
end
