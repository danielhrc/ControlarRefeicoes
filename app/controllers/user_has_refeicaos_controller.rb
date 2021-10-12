class UserHasRefeicaosController < ApplicationController
  before_action :set_user_has_refeicao, only: %i[ show edit update destroy ]

  # GET /user_has_refeicaos or /user_has_refeicaos.json
  def index
    @user_has_refeicaos = UserHasRefeicao.all
  end

  # GET /user_has_refeicaos/1 or /user_has_refeicaos/1.json
  def show
  end

  # GET /user_has_refeicaos/new
  def new
    @user_has_refeicao = UserHasRefeicao.new
  end

  # GET /user_has_refeicaos/1/edit
  def edit
  end

  # POST /user_has_refeicaos or /user_has_refeicaos.json
  def create
    @user_has_refeicao = UserHasRefeicao.new(user_has_refeicao_params)

    respond_to do |format|
      if @user_has_refeicao.save
        format.html { redirect_to @user_has_refeicao, notice: "User has refeicao was successfully created." }
        format.json { render :show, status: :created, location: @user_has_refeicao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_has_refeicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_has_refeicaos/1 or /user_has_refeicaos/1.json
  def update
    respond_to do |format|
      if @user_has_refeicao.update(user_has_refeicao_params)
        format.html { redirect_to @user_has_refeicao, notice: "User has refeicao was successfully updated." }
        format.json { render :show, status: :ok, location: @user_has_refeicao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_has_refeicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_has_refeicaos/1 or /user_has_refeicaos/1.json
  def destroy
    @user_has_refeicao.destroy
    respond_to do |format|
      format.html { redirect_to user_has_refeicaos_url, notice: "User has refeicao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_has_refeicao
      @user_has_refeicao = UserHasRefeicao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_has_refeicao_params
      params.require(:user_has_refeicao).permit(:user_id, :refeicao_id)
    end
end
