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
    respond_to do |format|
      tt = Time.now
      if tt.hour < Changzou::MIN_HOUR || tt.at_beginning_of_day < Time.parse("2015-4-24")
        format.html { redirect_to "/changzous", notice: '还未开抢' }
      elsif Changzou.today.count >= Changzou::MAX_COUNT
        format.html { redirect_to "/changzous/over" }
      else
        format.html { @changzou = Changzou.new }
      end
    end
  end

  # GET /changzous/1/edit
  def edit
  end

  # GET /changzous/share
  def share
    
  end

  # GET /changzous/over
  def over
    
  end

  # POST /changzous
  # POST /changzous.json
  def create
    @changzou = Changzou.new(changzou_params)
    respond_to do |format|
      if Time.now.hour < Changzou::MIN_HOUR
        format.html { redirect_to "/changzous", notice: '还未开抢' }
        format.json { render json: {errors: "还未开抢"} }
      elsif Changzou.today.count >= Changzou::MAX_COUNT
        format.html { redirect_to "/changzous/over" }
        format.json { render json: {:message => "超过最大数量"}, status: :unprocessable_entity }
      end
      if @changzou.save 
        format.html { redirect_to "/changzous/share", notice: 'Changzou was successfully created.' }
        format.json { render :show, status: :created, location: @changzou }
      else
        format.html { redirect_to "/changzous/over"}
        format.json { render json: @changzou.errors, status: :unprocessable_entity }
      end
    end
  end

  def check
    cz = Changzou.where(finger:params[:finger]).first
    render :json => {cz:cz}
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
