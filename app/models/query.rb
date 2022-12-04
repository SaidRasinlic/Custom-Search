class Query < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search, against: :query,
                           using: :trigram
  scope :user, lambda { |user_id|
    where(user_id: user_id)
  }
end
