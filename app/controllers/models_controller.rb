class ModelsController < ApplicationController
  before_action :set_model, only: %i[show update destroy]
  before_action :set_brand, only: [:create]

  # GET Brands/:id/models
  def index
    @models = Model.where(brand_id: params[:brand_id])
    render json: @models
  end

  # GET /models || /models?greater="greaterValue"&lower="lowerValue"
  def interval
    @models = if params[:greater] && params[:lower]
                Model.greaterThan(params[:greater]).smallerThan(params[:lower])
              else
                Model.all
              end

    render json: @models
  end

  # GET Brands/:id/models/1
  def show
    render json: @model
  end

  # POST Brands/:id/models
  def create
    @model = Model.new(model_params)
    @model.brand = @brand

    if @model.save
      render json: @model, status: :created, location: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /models/1
  def update
    if @model.update(model_update_params)
      render json: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /models/1
  def destroy
    @model.destroy
  end

  private # -------------------------------------------------------------------------------------------------------------------

  # Use callbacks to share common setup or constraints between actions.
  def set_model
    @model = Model.find(params[:id])
  end

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end

  # Only allow a list of trusted parameters through.
  def model_params
    params.require(:model).permit(:name, :average_price, :brand_id)
  end

  def model_update_params
    params.require(:model).permit(:average_price)
  end
end
