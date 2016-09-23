class InvitationsController < ApplicationController
	def create
		Invitation.create(user: User.find(session[:id]), other_user: User.find(params[:other]))
		redirect_to '/users'
	end
	def delete
	end

end