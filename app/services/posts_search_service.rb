class PostsSearchService 
  def self.search(curr_post, query)
    # {k => v}
    posts_ids = Rails.cache.fetch("posts_search/#{query}", expires_in: 1.hours) do
    curr_post.where("title LIKE ?", "%#{query}%").map(&:id)
    end

    curr_post.where(id: posts_ids)
  end
end