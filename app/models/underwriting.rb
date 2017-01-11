class Underwriting < ApplicationRecord
  belongs_to :title_request, autosave: true
  belongs_to :underwriter, autosave: true
end
