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

    def show
      specific_article = Article.find(params[:id])
      render json: {
          status: 'SUCCESS',
          message: "Loaded an article with id = #{params[:id]}",
          data: specific_article
      }, status: :ok
    end

    def create
      new_article = Article.new(article_params)
      if new_article.save
        render json: {
            status: 'SUCCESS',
            message: "Saved the article }",
            data: new_article
        }, status: :ok
      else
        render json: {
            status: 'eRROR',
            message: "can not Saved the article }",
            data: new_article.errors
        }, status: :unprocessable_entity
      end
    end

    def destroy
      destroy_article = Article.find(params[:id])
      destroy_article.destroy
      render json: {
          status: 'SUCCESS',
          message: "delete the article }",
          data: destroy_article
      }, status: :ok
    end


    def update
      update_article = Article.find(params[:id])
      if update_article.update_attributes(article_params)
        render json: {
            status: 'SUCCESS',
            message: "updated the article }",
            data: update_article
        }, status: :ok
      else
        render json: {
            status: 'ERROR',
            message: "can not update the article }",
            data: update_article.errors
        }, status: :unprocessable_entity
      end
    end



    private
    def article_params
      params.permit(:title, :body)
    end

  end
end