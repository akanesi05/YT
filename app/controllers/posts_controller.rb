class PostsController < ApplicationController
  def index
     @posts=Post.all #Postテーブルのすべての内容を取得する
  end

  def new    #フォーム用のコントローラー
    @post = Post.new
  end

  def create
     @post =Post.new(post_params)

     if @post.save
        redirect_to posts_path

     else 
      render :new
     end
  end

  def edit 
    @post =Post.find(params[:id])
  end

  def update
    @post =Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path

   else 
    render :edit
   end
  end

  def destroy
    @post =Post.find(params[:id])
    
    @post.destroy
      redirect_to posts_path
    

  end
  
  private#これは別のファイルで呼び出せないようにしている

  # Strong Parameters（ストロングパラメータ）
  def post_params
    params.require(:post).permit(:title, :content)  # 許可するパラメータを明示的に指定
  end
end
