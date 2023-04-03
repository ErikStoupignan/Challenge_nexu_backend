class ModelsController < ApplicationController
  before_action :set_model, only: %i[show update destroy]

  # GET /models
  def index
    @models = if params[:greater] && params[:lower] # Filter all the models between range given
                if params[:greater] > params[:lower] # Verify that greater is smallest than lower
                  ['LOWER cannot be greater than GREATER']
                else
                  Model.where('average_price >= ? AND average_price <= ?', params[:greater], params[:lower])
                end
              elsif params[:brand_id]
                Model.where(brand_id: params[:brand_id]) # Find a specific Id model inside a Brand
              else
                Model.all # If any id is not given, then return all the models
              end

    render json: @models
  end

  # GET /models/1
  def show
    render json: @model
  end

  # POST /models
  def create
    @model = Model.new(model_params)

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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_model
    @model = Model.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def model_params
    params.require(:model).permit(:name, :average_price, :brand_id, :greater, :lower)
  end

  def model_update_params
    params.require(:model).permit(:average_price)
  end
end
