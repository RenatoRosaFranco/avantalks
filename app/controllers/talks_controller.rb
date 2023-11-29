# frozen_string_literal: true

class TalksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_talk, only: [:show, :edit, :update, :destroy]

  def index
    @q = Talk.ransack(params[:q])
    @talks = @q.result(distinct: true)
               .order(created_at: :desc)
               .page(params[:page])
               .per(12)
  end

  def new
    @talk = Talk.new
    authorize @talk
  end

  def show
    @talks = Talk.where.not(id: @talk.id)
                 .order(created_at: :desc)
                 .page(params[:page])
                 .per(7)
  end

  def create
    talk = current_user.talks.build(talk_params)
    authorize talk

    if talk.save
      flash[:notice] = 'Talk criada com sucesso.'
      redirect_to talk_path(talk)
    else
      render :new
    end
  end

  def edit
    authorize @talk
  end

  def update
    authorize @talk

    if @talk.update(talk_params)
      flash[:notice] = 'Talk atualizada com sucesso.'
      redirect_to talk_path(@talk)
    else
      render :edit
    end
  end

  def destroy
    authorize @talk

    if @talk.destroy
      flash[:notice] = 'Talk removida com sucesso.'
    else
      flash[:notice] = 'Falha ao remover talk, tente novamente.'
    end

    redirect_to talks_path
  end

  private

  def set_talk
    @talk = Talk.friendly.find(params[:id])
  end

  def talk_params
    params.require(:talk)
          .permit(:title, :description, :speaker, :youtube_embedded_url)
  end
end
