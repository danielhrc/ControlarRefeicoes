require 'json'
require 'csv'

class RefeicaosController < ApplicationController
  before_action :set_refeicao, only: %i[ show edit update destroy ]

  # GET /refeicaos or /refeicaos.json
  def index
    @uHrs = UserHasRefeicao.where(user_id: current_user)

    if !@uHrs.nil?
      ids = []
      @uHrs.each do |u|
        ids << u.refeicao_id
      end
      if ids.length == 0
        ids = [0]
      end


      @refeicaos = Refeicao.paginate_by_sql("select * from refeicaos where refeicaos.id in (#{ids.join(",")}) order by refeicaos.hora desc",:page => params[:page], :per_page=>5)

      else @refeicaos = nil

    end


  end

  # GET /refeicaos/1 or /refeicaos/1.json
  def show
    u_id = UserHasRefeicao.find_by_refeicao_id(@refeicao).user_id
    unless u_id.nil?
      if current_user.id.eql?(u_id)
        # puts "#{Time.now}: User #{u_id} looked for refeicao ##{@refeicao.id}"
      else
        render json: 'nothing here'
      end

    end

  end

  def export_excel
    @uHrs = UserHasRefeicao.where(user_id: current_user)

    if !@uHrs.nil?
      ids = []
      @uHrs.each do |u|
        ids << u.refeicao_id
      end
      if ids.length == 0
        ids = [0]
      end
    end

    @refs = Refeicao.find_by_sql("select * from refeicaos where refeicaos.id in (#{ids.join(",")}) order by refeicaos.hora")
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"refeicoes #{DateTime.now}.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  # GET /refeicaos/new
  def new
    @refeicao = Refeicao.new
    UserHasRefeicao.create(user: current_user, refeicao: @refeicao)
  end

  # GET /refeicaos/1/edit
  def edit
    u_id = UserHasRefeicao.find_by_refeicao_id(@refeicao).user_id
    unless u_id.nil?
      if current_user.id.eql?(u_id)
        # puts "#{Time.now}: User #{u_id} looked for refeicao ##{@refeicao.id}"
      else
        render json: 'nothing here'
      end

    end
  end

  # POST /refeicaos or /refeicaos.json
  def create
    @refeicao = Refeicao.new(refeicao_params)

    respond_to do |format|
      if @refeicao.save
        format.html { redirect_to @refeicao, notice: "Refeicao was successfully created." }
        format.json { render :show, status: :created, location: @refeicao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @refeicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /refeicaos/1 or /refeicaos/1.json
  def update
    respond_to do |format|
      u_id = UserHasRefeicao.find_by_refeicao_id(@refeicao).user_id
      unless u_id.nil?
        if current_user.id.eql?(u_id)
          # puts "#{Time.now}: User #{u_id} looked for refeicao ##{@refeicao.id}"
        else
          render json: 'nothing here'
        end

      end
      if @refeicao.update(refeicao_params)
        format.html { redirect_to @refeicao, notice: "Refeicao was successfully updated." }
        format.json { render :show, status: :ok, location: @refeicao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @refeicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refeicaos/1 or /refeicaos/1.json
  def destroy
    @userHasRef = UserHasRefeicao.find_by_refeicao_id(@refeicao)
    u_id = UserHasRefeicao.find_by_refeicao_id(@refeicao).user_id
    unless u_id.nil?
      if current_user.id.eql?(u_id)
        # puts "#{Time.now}: User #{u_id} looked for refeicao ##{@refeicao.id}"
      else
        render json: 'nothing here'
      end

    end
    if !@userHasRef.nil?
      @userHasRef.destroy
    end

    @refeicao.destroy
    respond_to do |format|
      format.html { redirect_to refeicaos_url, notice: "Refeicao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refeicao
      @refeicao = Refeicao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def refeicao_params
      params.require(:refeicao).permit(:tipo, :alimentos, :sentimento, :hora)
    end
end
