class DonorsController < ApplicationController
	before_action :set_donor, only: [:show, :edit, :update, :destroy]

	def new
		@donor = Donor.new 
	end

	def create
		@donor = Donor.new(donor_params)

		if @donor.save
			session[:donor_id] = @donor.id
			redirect_to donor_path(@donor)
		else
			flash.now.alert = "Apologies. Your Registration was not recorded."
			render 'new'  
		end
	end

	def edit
	end

	def update
		if @donor.update(donor_params)
			redirect_to donor_path(@donor)
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@donor.destroy
		flash[:alert] = "You have successfully deleted your account."
		redirect_to root_path
	end

	private

	def donor_params
		params.require(:donor).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

	def set_donor
		@donor = Donor.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The Donor you were looking for could not be found."
	end
end