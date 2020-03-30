class MeasureDatesController < ApplicationController
  before_action :set_measure_date, only: [:show, :update, :destroy]

  def index
    @measureDates = MeasureDate.where('user_id = ?', current_user.id)
    json_response(@measureDates)
  end

  def create
    @measureDate = current_user.measure_date.build(measure_date_params)
    if @measure_date.save
      json_response(@measureDate, :created)
    else
      render json: { errors: @measureDate.errors.full_messages}, status: 422
    end
  end

  def show
    json_response(@measureDate)
  end

  def update
    @measureDate.update(measure_date_params)
    head :no_content
  end

  def destroy
    @measureDate.destroy
    head :no_content
  end

  private

  def measure_date_params
    params.require(:measure_date).permit(:date, :user_id)
  end

  def set_measure_date
    @measureDate = MeasureDate.find(params[:id])
  end
end
