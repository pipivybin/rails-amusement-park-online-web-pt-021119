require 'pry'

class AttractionsController < ApplicationController
    
    def index
        @attractions = Attraction.all
        @user = User.find_by(id: session[:user_id])
    end
    
    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :min_height, :happiness_rating)
    end
end
