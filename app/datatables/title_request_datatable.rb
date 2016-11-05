class TitleRequestDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :title_request_path

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||=
    [
      "TitleRequest.id",
      "TitleRequest.FILE_NO",
      "TitleRequest.LAST_NAME",
      "TitleRequest.FIRST_NAME",
      "TitleRequest.FILEOPENED",
      "TitleRequest.TOWN",
    ]
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||=
    [
      "TitleRequest.id",
      "TitleRequest.FILE_NO",
      "TitleRequest.LAST_NAME",
      "TitleRequest.FIRST_NAME",
      "TitleRequest.FILEOPENED",
      "TitleRequest.TOWN",
    ]
  end

  private

  def data
    puts(records.class.name)

    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        link_to("View Full Details", title_request_path(record)),
        record.FILE_NO,
        record.LAST_NAME,
        record.FIRST_NAME,
        record.FILEOPENED,
        record.TOWN
      ]
    end
  end

  def get_raw_records
    TitleRequest.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
