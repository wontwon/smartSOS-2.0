require 'spec_helper'

feature 'Creating Organizations' do
	before :each do
		visit root_url
		click_link 'Start A Campaign'
	end
	
	scenario 'can register a new organization with VALID attributes' do
		click_link 'Register New Organization'
		fill_in 'Name', with: 'ExampleOrg'
		fill_in 'Description', with: 'this is an example'
		fill_in 'Address', with: '1111 Organization Ave'
		fill_in 'City', with: 'ImagineLand'
		fill_in 'State',with: 'FarAway'
		fill_in 'Zip', with: '10011'
		fill_in 'Phone', with:'1234567890'
		fill_in	'Email', with: 'org@example.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password Confirmation', with: 'password'
		fill_in 'Website URL', with: 'orgexample.com'
		click_button 'Register Organization'

		org = Organization.where(name: 'ExampleOrg').first
		puts "WHAT IN THE WORLD: #{org}" 

		expect(page.current_url).to eq(organization_url(org))
	end

	scenario 'can NOT register a new organization with INVALID attributes' do
		click_link 'Register New Organization'
		fill_in 'Name', with: ''
		fill_in 'Description', with: 'this is an example'
		fill_in 'Address', with: '1111 Organization Ave'
		fill_in 'City', with: 'ImagineLand'
		fill_in 'State',with: 'FarAway'
		fill_in 'Zip', with: '10011'
		fill_in 'Phone', with: '1234567890'
		fill_in	'Email', with: 'org@example.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password Confirmation', with: 'password'
		fill_in 'Website URL', with: 'orgexample.com'
		click_button 'Register Organization'

		expect(page).to have_content('Apologies. Your Organization has not been registered.')
	end

end

feature 'Editing Organizations' do

	before :each do
		@org = create(:organization, email: "example@yahoo.com", password: 'password', password_confirmation: 'password')
	end

	describe 'Organization Administrators' do
		scenario 'can edit an existing organization' do
			visit '/'
			click_link 'Start A Campaign'
			fill_in 'Email', with: 'example@yahoo.com'
			fill_in 'Password', with: 'password'
			click_button 'Login'
			expect(page).to have_content 'Update Organization'
		end
	end

	describe 'Donors' do
		scenario 'can NOT edit an existing organization' do
			visit organization_url(@org)
			expect(page).to have_no_content 'Update Organization'
		end
	end

end