class PostsController < ApplicationController
  def index
     @post=Post.all #Postテーブルのすべての内容を取得する
  end

  def new    #フォーム用のコントローラー
    @posts = Post.new
  end

  def create
    
  end
end
