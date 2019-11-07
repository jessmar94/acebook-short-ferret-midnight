# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
    end

    if @post.save
      redirect_to posts_url
    else
      redirect_to root_path, notice: @post.errors.full_messages.first
    end
  end

  def edit
    @post = Post.where(id: params[:id]).first
    
      flash[:notice] = 'Sorry, you are not able to edit this post.' if current_user != @post.user

    redirect_to posts_url
  end

  def update
    @post = Post.where(id: params[:id]).first
    if current_user != @post.user
      flash[:notice] = 'Sorry, you are not able to edit this post.'
    elsif @post.update(message: params[:post][:message])
      flash[:notice] = 'Successfully updated the post!'
      redirect_to posts_url
    else
      flash[:alert] = 'Couldn’t edit the post...'
      render :edit
    end
  end

  def destroy
    @post = Post.where(id: params[:id]).first
    if current_user != @post.user
      flash[:alert] = 'Sorry, you may only delete your own posts.'
    elsif @post.destroy
      flash[:notice] = 'Successfully deleted the post!'
    else
      flash[:alert] = 'Couldn’t delete the post...'
    end
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
