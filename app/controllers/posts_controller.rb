class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream
        format.html { redirect_to posts_path, notice: "Post was successfully created." }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("post_form", partial: "posts/form", locals: { post: @post })
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.turbo_stream
        format.html { redirect_to post_path(@post), notice: "Post was successfully updated." }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("post_form", partial: "posts/form", locals: { post: @post })
        end
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to posts_path, notice: "Post was successfully destroyed." }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
