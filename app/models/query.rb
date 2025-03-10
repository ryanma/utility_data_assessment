class Query < ApplicationRecord
  validates :start, :end, :respondent, presence: true
  enum :respondent, [ "PJM", "PGE", "PACW", "CISO", "DUK", "ERCO", "MISO", "TVA", "NYIS", "FPL" ]
end
