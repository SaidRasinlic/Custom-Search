class Article < ApplicationRecord
  include PgSearch
  pg_search_scope :search, against: %i[title body],
                           using: {
                             tsearch: { prefix: true },
                           }
end
