module V1
  class ArticlesController < ApplicationController
    def index
      all_articles = Article.order('created_at DESC')
      render json: {
          status: 'SuCCESS',
          message: 'Loaded all articles',
          data: all_articles
      }, status: :ok
    end
  end
end