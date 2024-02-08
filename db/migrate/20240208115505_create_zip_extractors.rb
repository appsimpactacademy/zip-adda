class CreateZipExtractors < ActiveRecord::Migration[7.0]
  def change
    create_table :zip_extractors do |t|
      t.string :compressed_file_path
      t.string :extracted_file_path

      t.timestamps
    end
  end
end
