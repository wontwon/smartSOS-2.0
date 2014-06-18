require 'spec_helper'

feature 'Donor Sign Up' do

	scenario 'valid sign up' do
		visit root_path
		click_link 'Make A Pledge'
		click_link 'Register New Donor'
		fill_in 'First Name', with: 'Example'
		fill_in 'Last Name', with: 'Example'
		fill_in 'Email', with: 'example@yahoo.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password Confirmation', with: 'password'
		click_button 'Register Donor'

		donor = Donor.find_by_email('example@yahoo.com')

		expect(current_path).to eq donor_path(donor)
	end

	scenario 'invalid sign up' do
		visit root_path
		click_link 'Make A Pledge'
		click_link 'Register New Donor'
		fill_in 'First Name', with: nil
		fill_in 'Last Name', with: 'example'
		fill_in 'Email', with: 'example@yahoo.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password', with: 'password'
		click_button 'Register Donor'
		expect(page).to have_content 'Apologies. Your Registration was not recorded.'
	end

end


feature 'Donor Sign In' do

	scenario 'sign in with valid credentials' do
		donor = create(:donor, email: 'example@yahoo.com', password: 'password', password_confirmation: 'password')

		visit root_path
		click_link 'Make A Pledge'
		fill_in 'Email', with: 'example@yahoo.com'
		fill_in 'Password', with: 'password'
		click_button 'Login'
		expect(current_path).to eq donor_path(donor)
	end

	scenario 'sign in with invalid credentials' do
		donor = create(:donor)

		visit root_path
		click_link 'Make A Pledge'
		fill_in 'Email', with: donor.email
		fill_in 'Password', with: nil
		click_button 'Login'
		expect(page).to have_content "Invalid Password"
	end

end

feature 'Donor view actions' do

	scenario 'donor can view all campaigns without logging in' do
		visit root_path
		click_link 'Browse Campaigns'
		expect(current_path).to eq campaigns_path
	end

	scenario 'donor can view a specific campaign' do
	
		campaign = create(:campaign, name: "ExampleCampaign")
		visit root_path
		expect(page).to have_content 'Browse Campaigns'
		click_link 'ExampleCampaign'
		expect(page).to have_content 'ExampleCampaign'
	end

end