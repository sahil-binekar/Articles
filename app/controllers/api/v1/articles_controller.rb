class Api::V1::ArticlesController < ApiController
    before_action :set_article, only: [:show, :update, :destroy]
    def index
        # @articles = Article.all
       render json: @articles = current_user.articles
    end

    def create
        # @article = Article.new(article_params)
        @article = current_user.articles.new(article_params)
        if @article.save
            render json: {
                data: @article,
                message: 'Article created',
            }, status: :ok
        else
            render json: {
                 data: @article.errors.full_messages,
                 status: 'failed' 
            }, status: :unprocessable_entity
        end
    end

    def show
        render json: @article, status: :ok
    end

    def update
        if @article.update(article_params)
            render json: {
                data: @article,
                message: 'Article updated',
            }, status: :ok
        else
            render json: {
                 data: @article.errors.full_messages,
                 status: 'failed' 
            }, status: :unprocessable_entity
        end
    end

    def destroy
        if @article.destroy
            render json: {
                status: {
                    code: 200,
                    message: 'Article deleted successfully'
                }
            },
            status: :ok
        else
            render json: {
                data: 'Something went wrong',
                status: 'failed'
            }
        end 
    end

    private

    def set_article
        # @article = Article.find(params[:id ])
        @article = current_user.articles.find(params[:id ])
    rescue ActiveRecord::RecordNotFound => error
        render json: error.message, status: :unauthorized
    end

    def article_params
        params.require(:article).permit(:title, :body, :user_id)
    end
end