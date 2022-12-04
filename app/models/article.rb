class Article < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: %i[title body], using: {
             tsearch: { prefix: true },
           }
  # include PgSearch
  # pg_search_scope :search, against: %i[title body],
  #                          using: {
  #                            tsearch: { prefix: true },
  #                          }
end
