class ArticlesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_article, except: [:index, :new, :create]

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            flash[:notice] = "Article successfully Created!"
          redirect_to @article
        else
            render 'new'
        end
    end

    def show
    end

    def edit
        if current_user != @article.user
            flash[:alert] = "Access Denied!"
            flash[:notice] = "Article successfully edited!"
            redirect_to root_path
        end
    end

    def update
        if current_user != @article.user
            flash[:alert] = "Access Denied!"
            redirect_to root_path
        else
            if @article.update(article_params)
                flash[:notice] = "Article successfully updated!"
                redirect_to @article
            else
                render 'edit'
            end
        end
    end

    def destroy
        if current_user != @article.user
            flash[:alert] = "Access Denied!"
            redirect_to root_path
        else
            @article.destroy
            flash[:notice] = "Article successfully destroyed!"
            redirect_to articles_path
        end
    end

    private

    def find_article
        @article = Article.find(params[:id]) 
    end

    def article_params
        params.require(:article).permit(:title, :text, :image)
    end
end
