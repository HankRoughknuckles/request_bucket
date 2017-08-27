class Api::EndpointsController < ApplicationController
  before_action :get_endpoint, only: [:show, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:update]

  def index
    @endpoints = Endpoint.all
  end

  def create
    @endpoint = Endpoint.create
    redirect_to @endpoint
  end

  def show
  end

  def update
    headers = request.headers.select{|k, _v| k =~ /^HTTP/ }
    headers = headers.inject({}) do |memo, new|
      memo[new[0][5..-1].dasherize] = new[1]
      memo
    end
    information = {
      url: request.url,
      headers: headers,
      body: request.body.read
    }.to_json
    @endpoint.requests.create(information: information)

    render json: { success: true }
  end

  private
  def get_endpoint
    @endpoint = Endpoint.find_by(signature: params[:signature])
  end
end
