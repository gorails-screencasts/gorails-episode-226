module SearchFallback
  extend ActiveSupport::Concern

  included do

    rescue_from ActiveRecord::RecordNotFound do |exception|
      @query = params[:id].gsub(/[^\w-]/, '')
      @episodes = Episode.where("name LIKE ? OR slug LIKE ?", "%#{@query}%", "%#{@query}%")
      @forum_threads = Episode.where("name LIKE ? OR slug LIKE ?", "%#{@query}%", "%#{@query}%")
      render "/search/show"
    end

  end
end
