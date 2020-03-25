class MeasuresController < ApplicationController
  before_action :set_measure, only: [:show, :update, :destroy]

  def index
    @measures = Measure.all
    json_response(@measures)
  end

  def create
    @measure = Measure.create!(measure_params)
    json_response(@measure, :created)
  end

  def show
    json_response(@measure)
  end

  def update
    @measure.update(measure_params)
    head :no_content
  end

  def destroy
    @measure.destroy
    head :no_content
  end

  private

  def measure_params
    params.permit(:name)
  end

  def set_measure
    @measure = Measure.find(params[:id])
  end
end
