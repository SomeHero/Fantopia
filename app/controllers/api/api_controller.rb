# controller for the API
class Api::ApiController < ApplicationController

	API_VERSION = '1.0'

	def leagues
		leagues = League.all

		results = []
		leagues.each do |league|
        	results << league.to_api
        end

		render_result(results)
	end

	def teams
		teams = Team.all

		render_result(teams.find(1).to_api)
	end

	def games
		games = Game.includes(:home_team,:away_team,:league,:game_location).all

		results = []
		games.each do |game|
        	results << game.to_api
        end

		render_result(results) 
	end

	def game_locations
		game_locations = GameLocation.all

		results = []
		game_locations.each do |game_location|
			results <<game_location.to_api
		end

		render_result(results)
	end

	# render a result in the appropriate format
	def render_result(result = {}, status = 200, status_string = 'OK')
		return_value = {'version' => API_VERSION,
			'statusCode' => status,
			'statusString' => status_string,
			'result' => result}
			if params[:callback]
				render :text => "#{params[:callback]}(#{return_value.to_json});", :content_type => "application/javascript"
			elsif params[:isIEPhoto]
				render :text=> return_value.to_json, :content_type => "text/plain"
			else
				render :json => return_value.to_json
			end
		end
	end
