require 'typhoeus'
require 'rest-graph'
class FetcherController < ApplicationController
  def index
    @page = Page.new
  end

  def create
  end
end
