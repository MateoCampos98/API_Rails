class PostsSearchService 
  def self.search(curr_post, query)
    curr_post.where("title LIKE ?", "%#{query}%")
  end
end