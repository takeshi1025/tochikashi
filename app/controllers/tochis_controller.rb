class TochisController < ApplicationController
  def index
    @tochis = Tochi.all
  end

  def show
    @tochi = Tochi.find(params[:id])
    @comment = Comment.new
    @comments = @tochi.comments.order(created_at: :desc)
  end

  def new
    @tochi = Tochi.new
  end
  
  def create
    @tochi = Tochi.new(tochi_params)
    @tochi.user_id = current_user.id
    @tochi.save
    redirect_to tochi_path(@tochi)
  end
  
  def edit
    @tochi = Tochi.find(params[:id])
  end
  
  def update
    @tochi = Tochi.find(params[:id])
    @tochi.update(tochi_params)
    redirect_to tochi_path(@tochi)
  end
  
  def destroy
    tochi = Tochi.find(params[:id])
    tochi.destroy
    redirect_to tochis_path
  end
  
  def comments
    @user = User.find(params[:id])
    @comments = @user.comments.page(params[:page])
    counts(@user)
  end

  
  private
  def tochi_params
    params.require(:tochi).permit(:title, :body, :image)
  end
  

end
