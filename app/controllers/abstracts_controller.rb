class AbstractsController < ApplicationController
  def show
    @abstract = Abstract.find(params[:id])
  end

  def index
    @abstracts = Abstract.paginate(page: params[:page])
  end
end
