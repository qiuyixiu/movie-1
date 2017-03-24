class ImoviesController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :find_imovie_and_check_permission, only: [:edit, :update, :destroy]
  def index
    @imovies = Imovie.all
  end

  def show
    @imovie = Imovie.find(params[:id])
    @reviews = @imovie.reviews.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
  end

  def new
    @imovie = Imovie.new
  end

  def create
    @imovie = Imovie.new(imovie_params)
    @imovie.user = current_user

    if @imovie.save
       current_user.join!(@imovie)
       redirect_to imovies_path
    else
       render :new
    end
  end

  def update
    if @imovie.update(imovie_params)
      redirect_to imovies_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @imovie.destroy
    redirect_to imovies_path, alert:  "电影删除"
  end

  def join
    @imovie = Imovie.find(params[:id])

     if !current_user.is_member_of?(@imovie)
       current_user.join!(@imovie)
       flash[:notice] = "收藏电影成功！"
     else
       flash[:warning] = "你已经是本电影评论成员了！"
     end

     redirect_to imovie_path(@imovie)
   end

   def quit
     @imovie = Imovie.find(params[:id])

     if current_user.is_member_of?(@imovie)
       current_user.quit!(@imovie)
       flash[:alert] = "已退出收藏！"
     else
       flash[:warning] = "你不是本电影评论成员了，怎么退出 XD"
     end

     redirect_to imovie_path(@imovie)
   end

  private

  def find_imovie_and_check_permission
    @imovie = Imovie.find(params[:id])

    if current_user != @imovie.user
      redirect_to root_path, alert: "你没有权限。"
    end
  end

  def imovie_params
    params.require(:imovie).permit(:电影名称, :简介)
  end

end
