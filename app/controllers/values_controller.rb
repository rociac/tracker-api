class ValuesController < ApplicationController
  before_action :authenticate_user
  before_action :set_measure
  before_action :set_measure_value, only: [:show, :update, :destroy]

  def index
    json_response(@measure.values)
  end

  def show
    json_response(@value)
  end

  def create
    @measure.values.create!(value_params)
    json_response(@measure, :created)
  end

  def update
    @value.update(value_params)
    head :no_content
  end

  def destroy
    @value.destroy
    head :no_content
  end

  private

  def value_params
    params.permit(:value)
  end

  def set_measure
    @measure = Measure.find(params[:measure_id])
  end

  def set_measure_value
    @value = @measure.values.find_by!(id: params[:id]) if @measure
  end
end

