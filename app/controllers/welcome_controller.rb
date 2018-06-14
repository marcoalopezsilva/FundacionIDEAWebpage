class WelcomeController < ApplicationController
  def index
    @publications = Publication.all
  end
end
