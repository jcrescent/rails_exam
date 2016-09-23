class ConnectionsController < ApplicationController
	def create
		Connection.create(user: User.find(session[:id]), other_user: User.find(params[:other]))
		redirect_to '/users'
	end

	def delete
		connection = Connection.find_by(user: User.find(session[:id]), other_user: User.find(params[:id]))
		connection.destroy
		redirect_to '/profile'
	end

end