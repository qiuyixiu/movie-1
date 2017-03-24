class ImoviesController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :find_imovie_and_check_permission, only: [:edit, :update, :destroy]
  def index
    @imovies = Imovie.all
  end

  def show
    @imovie = Imovie.find(params[:id])
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
