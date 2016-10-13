class TitleRequestsController < ApplicationController

  def index
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
    @titlerequest = TitleRequest.new(title_request_params)

    if @titlerequest.save
      logger.debug("new guy created!")

      redirect_to edit_title_request_url(@titlerequest)
    else
      render 'new'
    end
  end

  def edit
    @titlerequest = TitleRequest.find(params[:id])
  end

  def update
    @titlerequest = TitleRequest.find(params[:id])

    if @titlerequest.update_attributes(title_request_params)
      flash[:success] = "Title request updated"
      redirect_to @titlerequest
    else
      flash[:danger] = "Update unsuccessful #{@titlerequest.errors.full_messages}"
      render 'edit'
    end
  end

  def generate_report
  end

  def generate_open_report
    if request.post?
      @beginning_date = Date.parse(params[:beginning_date])
      @ending_date = Date.parse(params[:ending_date])

      @titlerequests = TitleRequest.where("FILEOPENED >= ? AND FILEOPENED < ?", @beginning_date, @ending_date)
      render :xlsx => "open", :filename => "open_title_requests.xlsx"

    else
      @titlerequests = TitleRequest.file_not_closed
      render :xlsx => "open", :filename => "all_open_title_requests.xlsx"
    end
  end

  def generate_remittance_report
    @beginning_date = Date.parse(params[:beginning_date])
    @ending_date = Date.parse(params[:ending_date])

    logger.debug("Beginning: #{@beginning_date}, Ending: #{@ending_date}")
  end

  private
    def title_request_params
      Rails.logger.debug("update params received: #{params.inspect}")

      params.require(:title_request).permit!
    end
end
