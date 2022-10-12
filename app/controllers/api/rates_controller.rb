class Api::RatesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @rates = Rate.all.includes(:carrier).order(:carrier_id)
    end

    def update
        @rate = Rate.find(rate_params["id"])
        @rate = update_rate(@rate, rate_params)
        begin
            if @rate.save
                render :json => {status: 'success'}
            else
                render :json => {status: 'failed'}
            end
        rescue Exception => e
            render :json => {status: 'failed'}
        end
    end

    private

    def rate_params
        params.require(:rate).permit(:rate, :currency, :origin, :destination, :id)
    end

    def update_rate(rate, params)
        rate.currency = params["currency"]
        rate.rate = params["rate"]
        rate.origin = params["origin"]
        rate.destination = params["destination"]
        rate
    end
  end