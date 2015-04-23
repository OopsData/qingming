class ChangzousController < ApplicationController
  before_action :set_changzou, only: [:show, :edit, :update, :destroy]

  # GET /changzous
  # GET /changzous.json
  def index
    @changzous = Changzou.all
  end

  # GET /changzous/1
  # GET /changzous/1.json
  def show
  end

  # GET /changzous/new
  def new
    @changzou = Changzou.new
  end

  # GET /changzous/1/edit
  def edit
  end

  # POST /changzous
  # POST /changzous.json
  def create
    @changzou = Changzou.new(changzou_params)

    respond_to do |format|
      if @changzou.save
        format.html { redirect_to @changzou, notice: 'Changzou was successfully created.' }
        format.json { render :show, status: :created, location: @changzou }
      else
        format.html { render :new }
        format.json { render json: @changzou.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /changzous/1
  # PATCH/PUT /changzous/1.json
  def update
    respond_to do |format|
      if @changzou.update(changzou_params)
        format.html { redirect_to @changzou, notice: 'Changzou was successfully updated.' }
        format.json { render :show, status: :ok, location: @changzou }
      else
        format.html { render :edit }
        format.json { render json: @changzou.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /changzous/1
  # DELETE /changzous/1.json
  def destroy
    @changzou.destroy
    respond_to do |format|
      format.html { redirect_to changzous_url, notice: 'Changzou was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_changzou
      @changzou = Changzou.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def changzou_params
      params.require(:changzou).permit(:name, :mobile)
    end
end
