class ImoviesController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  def index
    @imovies = Imovie.all
  end

  def show
    @imovie = Imovie.find(params[:id])
  end

  def edit
    @imovie = Imovie.find(params[:id])
  end

  def new
    @imovie = Imovie.new
  end

  def create
    @imovie = Imovie.new(imovie_params)
    if @imovie.save
       redirect_to imovies_path
    else
       render :new
    end
  end

  def update
    @imovie = Imovie.find(params[:id])

    @imovie.update(imovie_params)

    redirect_to imovies_path, notice: "更新成功"
  end

  def destroy
    @imovie = Imovie.find(params[:id])
    @imovie.destroy
    flash[:alert] = "电影删除"
    redirect_to imovies_path
  end

  private

  def imovie_params
    params.require(:imovie).permit(:电影名称, :简介)
  end

end
