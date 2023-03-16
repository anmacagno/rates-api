# frozen_string_literal: true

class Api::V1::RatesController < ApplicationController
  def index
    @rates = Fedex::Rates.get(credentials, quote_params)
    render json: @rates
  rescue Fedex::Ws::ParserError, ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :unprocessable_entity
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def credentials
    params.require(:credentials).permit(:key, :password, :account_number, :meter_number)
  end

  def quote_params
    params.require(:quote_params).permit(
      address_from: %i[zip country],
      address_to: %i[zip country],
      parcel: %i[length width height distance_unit weight mass_unit]
    )
  end
end
