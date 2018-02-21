class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]
<<<<<<< HEAD

    if @advertisement.save
      flash[:notice] = "Question was saved."
      redirect_to @advertisement
    else
      flash.new[:alert] = "There was an error saving the question. Please try again."
=======
  
    if @advertisement.save
      flash[:notice] = "Advertisement was saved."
      redirect_to @advertisement
    else
      flash.new[:alert] = "There was an error saving the post. Please try again."
>>>>>>> 8a48e1c8fee2213692104cc132404f8b89b51d32
      render :new
    end
  end
end
