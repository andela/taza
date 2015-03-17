class TheTeamsController < ApplicationController
  def index
    @the_teams = TheTeam.all
  end
end
