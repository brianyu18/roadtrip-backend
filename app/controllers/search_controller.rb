require 'httparty'

class SearchController < ApplicationController
  skip_before_action :authorized, only: [:find, :findCord, :findEvent]


  def find
    location = params[:location]
    search = params[:search]
    puts ENV['get_data']
    puts params
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=#{ENV['get_data']}&sensor=false&location=#{location}&radius=47022&keyword=#{search}")
    puts response.body
    render json: response.body
  end

  def findCord
    puts "hello", ENV['get_data']
    city = params[:city]
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{city}&key=#{ENV['get_data']}")
    puts response.body
    render json: response.body
  end

  def findEvent
    place = params[:place]
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place}&key=#{ENV['get_data']}")
    puts response.body
    render json: response.body
  end

end
