class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index]
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
      flash[:notice] = "ジャンルを作成しました"
    else
      flash[:notice] = "ジャンル名を入力してください"
      redirect_to admin_genres_path
    end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
      flash[:notice] = "ジャンルを更新しました"
    else
      flash[:notice] = "ジャンルの更新に失敗しました"
      render 'edit'
    end
  end
  
  def destroy
    genre = Genre.find(params[:id])  
    genre.destroy  
    redirect_to admin_genres_path
  end
    
    private
    
  def genre_params
    params.require(:genre).permit(:name)
  end
      
end
