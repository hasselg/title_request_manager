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
      @beginning_date = Timeliness.parse(params[:beginning_date])
      @ending_date = Timeliness.parse(params[:ending_date])

      @titlerequests = TitleRequest.where("FILEOPENED >= ? AND FILEOPENED <= ?", @beginning_date, @ending_date)
      render :xlsx => "open", :filename => "open_title_requests.xlsx"

    else
      @titlerequests = TitleRequest.file_not_closed
      render :xlsx => "open", :filename => "all_open_title_requests.xlsx"
    end
  end

  def generate_remittance_report
    @beginning_date = Timeliness.parse(params[:beginning_date])
    @ending_date = Timeliness.parse(params[:ending_date])
    @underwriter = params[:underwriter]

    case @underwriter
    when "LT"
      @underwriter_name = "Lawyer's Title Insurance Company"
      @titlerequests = TitleRequest.where("REC_PAY_FN >= ? AND REC_PAY_FN <= ?",
        @beginning_date, @ending_date).order(:CLOSE_DATE)
    when "TT"
      @underwriter_name = "TICOR Title Insurance Company"
      @titlerequests = TitleRequest.where("REC_PAY_TT >= ? AND REC_PAY_TT <= ?",
        @beginning_date, @ending_date).order(:CLOSE_DATE)
    when "W"
      @underwriter_name = "Westcor Title Insurance Company"
      @titlerequests = TitleRequest.where("REC_PAY_W >= ? AND REC_PAY_W <= ?",
        @beginning_date, @ending_date).order(:CLOSE_DATE)
    when "FN"
      @underwriter_name = "Fidelity National Title Insurance Company"
      @titlerequests = TitleRequest.where("REC_PAY_FN >= ? AND REC_PAY_FN <= ?",
        @beginning_date, @ending_date).order(:CLOSE_DATE)
    end

    render xlsx: 'remittance_report', filename: "remitted_requests.xlsx", xlsx_use_shared_strings: true
  end

  private
    def title_request_params
      Rails.logger.debug("update params received: #{params.inspect}")

      params.require(:title_request).permit!
    end
end
