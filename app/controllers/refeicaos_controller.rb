require 'json'
require 'csv'

class RefeicaosController < ApplicationController
  before_action :set_refeicao, only: %i[ show edit update destroy ]

  # GET /refeicaos or /refeicaos.json
  def index
    @refeicaos = Refeicao.paginate(:page => params[:page], :per_page=>100)
  end

  # GET /refeicaos/1 or /refeicaos/1.json
  def show
  end

  def export_excel
    @refs = Refeicao.all
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"refeicoes.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  # GET /refeicaos/new
  def new
    @refeicao = Refeicao.new
  end

  # GET /refeicaos/1/edit
  def edit
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
