class HomeController < ApplicationController
  def index
    @zip_converter = ZipConverter.new
    @zip_extractor = ZipExtractor.new
  end

  def convert_to_zip
    ZipService.convert_to_zip(params[:zip_converter])
  end

  def extract_from_zip
    ZipService.extract_from_zip(params[:zip_extractor])
  end
end
