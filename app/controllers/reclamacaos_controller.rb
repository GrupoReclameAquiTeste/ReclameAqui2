class ReclamacaosController < ApplicationController
  before_action :set_reclamacao, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:new]

  # GET /reclamacaos
  # GET /reclamacaos.json
  def index
    @reclamacaos = Reclamacao.all
  end

  # GET /reclamacaos/1
  # GET /reclamacaos/1.json
  def show
  end

  # GET /reclamacaos/new
  def new
    # nova reclamação só é criada se estiver logado
    if logged_in?
      @reclamacao = Reclamacao.new
    else
      redirect_to '/login'
    end

  end

  # GET /reclamacaos/1/edit
  def edit
    if not (logged_in? and @reclamacao.usuario_id == current_user.id)
      redirect_to '/reclamacaos'
    end
  end

  # POST /reclamacaos
  # POST /reclamacaos.json
  def create
    parametros = reclamacao_params.merge({:usuario_id => current_user.id}) # alocando a id do usuario na reclmacao
    @reclamacao = Reclamacao.new(parametros)

    respond_to do |format|
      if @reclamacao.save
        format.html { redirect_to @reclamacao, notice: 'Reclamacao was successfully created.' }
        format.json { render :show, status: :created, location: @reclamacao }
      else
        format.html { render :new }
        format.json { render json: @reclamacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reclamacaos/1
  # PATCH/PUT /reclamacaos/1.json
  def update
    respond_to do |format|
      if @reclamacao.update(reclamacao_params)
        format.html { redirect_to @reclamacao, notice: 'Reclamacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @reclamacao }
      else
        format.html { render :edit }
        format.json { render json: @reclamacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reclamacaos/1
  # DELETE /reclamacaos/1.json
  def destroy
    @reclamacao.destroy
    respond_to do |format|
      format.html { redirect_to reclamacaos_url, notice: 'Reclamacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reclamacao
      @reclamacao = Reclamacao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reclamacao_params
      params.require(:reclamacao).permit(:titulo, :texto, :categoria_problema, :empresa, :usuario_id)
    end
end
