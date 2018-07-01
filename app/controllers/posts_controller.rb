class PostsController < ApplicationController

    #run rake routes in terminal and it will spit back all your routes

    def index #index page of blog
        @posts = Post.all.order("created_at DESC")
    end

    def new #path you take to actually create a new post
        @post = Post.new
    end

    def create #action takes place when you create and you need to pass
                #in the parameters look at the private down below
        @post = Post.new(post_params)

        if @post.save #checking to see if post saved
            redirect_to @post
        else
            render 'new' 
        end
    end

    def show #view the individual blog post
        @post = Post.find(params[:id])
    end

    def update #edit
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def edit #edit
        @post = Post.find(params[:id])
    end

    def destroy #delete
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path

    end

    private #added this because we will use this in multiple places

    def post_params
        params.require(:post).permit(:title, :content)
    end

end

