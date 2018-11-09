require 'csv'

class ImportsController < ApplicationController

  def new
  end

  def create
    if params.key?(:import)
      file = params.require(:import).permit!["file"]
      a = CSV.read(file.tempfile).transpose
      @import = []
      (a.size - 1).times do |i|
        @import << { name: (65 + i).chr, data: a[0].zip(a[1 + i]).to_h }
      end
      render new_import_path
    else
      redirect_to new_import_url
    end
  end

  def index
    redirect_to new_import_url
  end
end
