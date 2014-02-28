class UploadController < ApplicationController
  # initial page - renders the upload form
  def new
  end

  # Processes the upload form.
  def upload
   @uploaded_file_name = params[:data_file][:file].original_filename
   @gross_revenue = Parser.process(params[:data_file][:file].read)
   flash[:notice] = "File upload succeeded!"
 rescue => e
   flash[:alert] = "Failed to process uploaded file: #{e.message}"
   redirect_to upload_new_path
  end
end
