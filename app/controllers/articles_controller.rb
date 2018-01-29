class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
    	@articles = Article.all
  	end
    
    def show
		@article = Article.find(params[:id])
	end 
  	
  	def new
		@article = Article.new 
	end 
	
	def edit
  		@article = Article.find(params[:id])
	end

	def create 
		@article = Article.new(article_params)
		
	   if @article.save
			redirect_to @article 
	    else 
			render 'new'
	  end 
	end 

	def update
  		@article = Article.find(params[:id])
 
      if @article.update(article_params)
         redirect_to @article
      	else
    	 render 'edit'
      end
    end

    def destroy
  		@article = Article.find(params[:id])
  		@article.destroy
 
 		redirect_to articles_path
    end
	private 
	
	def article_params 
		params.require(:article).permit(:title, :text)
	end 

	

end 
#First I decided to create a blog which you can input and save your articles in two columns, text and title while you are logged in. 
#Rails was the web development framework written in Ruby language. I generated new blog file, and some gems libraries (readyc code) came with it. 
#I used Model View Controller software architecture for the benefits of clear separation between presentation logic and business logic. 
#Also, Resources: articles were created based on the Object Oriented Programming concept.I used Bootstrap for making a responsive interface.
#I used CRUD HTTP operation, GET, POST, PUT, DELETE by the RESTful API resource for showing, creating, updating or deleting the articles.



