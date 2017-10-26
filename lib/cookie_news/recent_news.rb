class RecentNews < CookieCollection
  RECENT_NEWS_SIZE = 10

  def initialize cookies
    super cookies
    self.ids = ids.last(RECENT_NEWS_SIZE)

    ids.each {
        |news_id| push Backend::News.find(news_id)
    #   byebug
    }
    # byebug
  end

  def push news
    delete news
    while length > RECENT_NEWS_SIZE - 1
      delete_at 0
    end
    super news
  end
end