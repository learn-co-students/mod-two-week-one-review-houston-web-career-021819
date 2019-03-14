class SeasController < ApplicationController

  def welcome

  end

  # get "/seas" do
  #   @seas = Sea.all
  #   erb :'index.html'
  # end

  def index
    @seas = Sea.all
  end
  #
  # get "/seas/new" do
  #   erb :'new.html'
  # end

  def new
    @sea = Sea.new
  end

  # get "/seas/:id" do
  #   @sea = Sea.find(params[:id])
  #   erb :'show.html'
  # end

  def show
    @sea = Sea.find(params[:id])
  end
  #
  # post "/seas" do
  #   @sea = Sea.new(params)
  #   @sea.save
  #   redirect to "/seas/#{@sea.id}"
  # end

  def create
    @sea = Sea.new(sea_params)
    @sea.save
    redirect_to ("/seas/#{@sea.id}")
  end
  #
  # get "/seas/:id/edit" do
  #   @sea = Sea.find(params[:id])
  #
  #   erb :'edit.html'
  # end

  def edit
    @sea = Sea.find(params[:id])
  end
  #
  # patch "/seas/:id" do
  #   @sea = Sea.find(params[:id])
  #   params.delete("_method")
  #   params[:has_mermaids] ||= false
  #   @sea.update(params)
  #   redirect to "/seas/#{@sea.id}"
  # end

  def update
    @sea = Sea.find(params[:id])
    params[:has_mermaids] ||= false
    @sea.update(sea_params)
    redirect_to ("/seas/#{@sea.id}")
  end
  #
  # delete "/seas/:id" do
  #   @sea = Sea.find(params[:id])
  #   @sea.destroy
  #   redirect to "/seas"
  # end

  def destroy
    @sea = Sea.find(params[:id])
    @sea.destroy
  end


  private=
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
