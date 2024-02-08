require 'zip'

class ZipService
  def self.convert_to_zip(params)
    zip_folder_path = params[:zip_folder_path]
    folder_path = params[:folder_path]
    Zip::File.open(zip_folder_path, Zip::File::CREATE) do |zip_file|
      Dir[File.join(folder_path, '**', '**')].each do |file|
        relative_path = file.sub("#{folder_path}/", '')
        zip_file.add(relative_path, file)
      end
      ZipConverter.create(zip_folder_path: zip_folder_path, folder_path: folder_path)
    end
  end

  def self.extract_from_zip(params)
    extracted_file_path = params[:extracted_file_path]
    compressed_file_path = params[:compressed_file_path]
    Zip::File.open(compressed_file_path) do |zip_file|
      zip_file.each do |entry|
        entry_path = File.join(extracted_file_path, entry.name)
        FileUtils.mkdir_p(File.dirname(entry_path))
        zip_file.extract(entry, entry_path) unless File.exist?(entry_path)
      end
      ZipExtractor.create(extracted_file_path: extracted_file_path, compressed_file_path: compressed_file_path)
    end
  end
end