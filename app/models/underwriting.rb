class Underwriting < ApplicationRecord
  belongs_to :title_request
  belongs_to :underwriter
end
