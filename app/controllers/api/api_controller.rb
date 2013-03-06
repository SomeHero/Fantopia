# controller for the API
class Api::ApiController < ApplicationController

	API_VERSION = '1.0'

	def teams
		teams = Team.all

		render_result(teams.find(1).to_api)
	end

	def games
		games = Game.all

		render_result(games) 
	end

	def leagues
		leagues = League.first

		render_result(leagues.to_api)
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
