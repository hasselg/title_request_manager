class TitleRequestsController < ApplicationController

  def index
    @titlerequests = TitleRequest.paginate(page: params[:page])
  end

  def ajaxindex
    @titlerequests = TitleRequest.all
    render json: @titlerequests
  end

  def show
    @titlerequest = TitleRequest.find(params[:id])
  end

  def new
    @titlerequest = TitleRequest.new
  end

  def create
    @titlerequest = TitleRequest.new(request_params)
  end

  private
    def request_params
    end
end
