class Episode < ApplicationRecord
  def to_param
    slug
  end
end
