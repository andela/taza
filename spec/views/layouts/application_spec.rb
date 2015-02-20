require 'rails_helper'

describe "layouts/application.html.erb" do
    it 'shows all links' do
      render

      expect(rendered).to have_link("Taza")
      expect(rendered).to have_link("Who we are")
      expect(rendered).to have_link("Our Fellows")
      expect(rendered).to have_link("Your Role")
      expect(rendered).to have_link("How it Works")
  end
end