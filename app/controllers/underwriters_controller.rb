class UnderwritersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @underwriters = Underwriter.all
  end

  def create
    @underwriter = Underwriter.new(underwriter_params)

    if @underwriter.save
      flash[:success] = "Underwriter #{@underwriter.name} created successfully."
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def new
    @underwriter = Underwriter.new
  end

  def edit
    @underwriter = Underwriter.find(params[:id])
  end

  def show
    @underwriter = Underwriter.find(params[:id])
  end

  def update
    @underwriter = Underwriter.find(params[:id])

    if @underwriter.update_attributes(underwriter_params)
      flash[:success] = "Underwriter #{@underwriter.name} updated successfully"
      redirect_to action: "index"
    else
      flash[:danger] = "Underwriter #{@underwriter.name} not updated because of the following error(s): #{@underwriter.errors.full_messages}"
      render 'edit'
    end
  end

  def destroy
    # Is it possible to remove if there are still things associated with this Underwriter?
  end

  private
    def underwriter_params
      params.require(:underwriter).permit(:name, :abbreviation)
    end

end
