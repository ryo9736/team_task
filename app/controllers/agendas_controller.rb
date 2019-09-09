class AgendasController < ApplicationController
  before_action :set_agenda, only: %i[show edit update destroy]
  before_action :check_agenda_authority, only: %I[edit update destroy]

  def index
    @agendas = Agenda.all
  end

  def new
    @team = Team.friendly.find(params[:team_id])
    @agenda = Agenda.new
  end

  def create
    @agenda = current_user.agendas.build(title: params[:title])
    @agenda.team = Team.friendly.find(params[:team_id])
    current_user.keep_team_id = @agenda.team.id
    if current_user.save && @agenda.save
      redirect_to dashboard_url, notice: 'アジェンダ作成に成功しました！'
    else
      render :new
    end
  end

  def destroy
    assign_user = Assign.all.where(team_id: @agenda.team_id).select("user_id")
    assign_user.each do |user|
      DeleteAgendaMailer.delete_agenda_mail(@agenda, user).deliver
    end
    @agenda.destroy
    redirect_to dashboard_url, notice: 'アジェンダを削除しました！'
  end

  private

  def set_agenda
    @agenda = Agenda.find(params[:id])
  end

  def agenda_params
    params.fetch(:agenda, {}).permit %i[title description]
  end

  def check_agenda_authority
    if @agenda.user_id == current_user.id || Team.find(@agenda.team_id).owner.id == current_user.id
    else
      redirect_to dashboard_url, notice: '権限がありません'
    end
  end
end
