require 'spec_helper'

describe "Creating new users" do 
	it "redirects to the user index page on success" do
		visit "/users"
		click_link "New User"
		expect(page).to have_content("New User")

		fill_in "First name", with: "Joe"
		fill_in "Last name", with: "Montana"
		fill_in "Email", with: "joe@montana.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"
		click_button "Create User"

		expect(page).to have_content("User was successfully created.")
	end

	it "displays error when user does not enter email" do 
		expect(User.count).to eq(0)

		visit "/users"
		click_link "New User"
		expect(page).to have_content("New User")

		fill_in "First name", with: "Joe"
		fill_in "Last name", with: "Montana"
		fill_in "Email", with: ""
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"
		click_button "Create User"

		expect(page).to_not have_content("User was successfully created.")
	end

	it "displays an error when passwords do not match" do
		visit "/users"
		click_link "New User"
		expect(page).to have_content("New User")	

		fill_in "First name", with: "Joe"
		fill_in "Last name", with: "Montana"
		fill_in "Email", with: "joe@montana.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "rabbit"
		click_button "Create User"

		expect(page).to_not have_content("User was successfully created.")
	end

	it "displays an error when password is less than 8 characters" do
		visit "/users"
		click_link "New User"
		expect(page).to have_content("New User")	

		fill_in "First name", with: "Joe"
		fill_in "Last name", with: "Montana"
		fill_in "Email", with: "joe@montana.com"
		fill_in "Password", with: "test"
		fill_in "Password confirmation", with: "test"
		click_button "Create User"

		expect(page).to_not have_content("User was successfully created.")
	end

	it "displays an error when user's first name is not entered" do
		visit "/users"
		click_link "New User"
		expect(page).to have_content("New User")	

		fill_in "First name", with: ""
		fill_in "Last name", with: "Montana"
		fill_in "Email", with: "joe@montana.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"
		click_button "Create User"

		expect(page).to_not have_content("User was successfully created.")
	end

		it "displays an error when user's last name is not entered" do
		visit "/users"
		click_link "New User"
		expect(page).to have_content("New User")	

		fill_in "First name", with: "Jerry"
		fill_in "Last name", with: ""
		fill_in "Email", with: "jerry@rice.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"
		click_button "Create User"

		expect(page).to_not have_content("User was successfully created.")
	end

end