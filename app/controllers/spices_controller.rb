class SpicesController < ApplicationController
    def index
      spices = Spice.all
      render json: spices
    end
  
    def create
      spice = Spice.new(spice_params)
      if spice.save
        render json: spice, status: :created
      else
        render json: spice.errors, status: :unprocessable_entity
      end
    end
  
    def update
      spice = Spice.find(params[:id])
      if spice.update(spice_params)
        render json: spice
      else
        render json: spice.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      spice = Spice.find(params[:id])
      spice.destroy
      head :no_content
    end
  
    private
  
    def spice_params
      params.require(:spice).permit(:title, :image, :description, :notes, :rating)
    end
  end