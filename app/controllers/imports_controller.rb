require 'csv'

class ImportsController < ApplicationController

  def new
  end

  def create
    file = params.require(:import).permit!["file"]
    @import = CSV.read(file.tempfile).to_h
    render new_import_path
  end

  def index
    redirect_to new_import_url
  end
end
