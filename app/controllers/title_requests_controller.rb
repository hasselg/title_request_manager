class TitleRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html
      format.json { render json: TitleRequestDatatable.new(view_context) }
    end
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

      @titlerequests = TitleRequest.where("fileopened >= ? AND fileopened <= ?", @beginning_date, @ending_date)
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
      when "TT"
        @underwriter_name = "TICOR Title Insurance Company"
      when "W"
        @underwriter_name = "Westcor Title Insurance Company"
      when "FN"
        @underwriter_name = "Fidelity National Title Insurance Company"
    end

    @official = Settings.agency.certifying_official.upcase
    @agency = Settings.agency.name
    @agency_number = Settings.agency.number

    @titlerequests = TitleRequest.where("rec_pay >= ? AND rec_pay <= ? AND lt_tt_w_fn = ?",
      @beginning_date, @ending_date, @underwriter).order(:close_date)

    @sum_base_premiums = @titlerequests.sum(:b_prem_mtg) + @titlerequests.sum(:b_prem_fee)
    @sum_stand_end_premiums = @titlerequests.sum(:stand_amnt)
    @sum_risk_end_premiums = @titlerequests.sum(:risk_amnt)
    @sum_total_premiums = @titlerequests.sum(:total_m_prem) + @titlerequests.sum(:total_o_prem)
    @sum_remittance = @titlerequests.sum(:remit_amnt)

    render xlsx: 'remittance_report', filename: "remitted_requests.xlsx",
      xlsx_use_shared_strings: true
  end

  private
    def title_request_params
      Rails.logger.debug("update params received: #{params.inspect}")

      params.require(:title_request).permit!
    end
end
