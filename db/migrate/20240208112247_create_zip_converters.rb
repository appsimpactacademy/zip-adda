class CreateZipConverters < ActiveRecord::Migration[7.0]
  def change
    create_table :zip_converters do |t|
      t.string :folder_path
      t.string :zip_folder_path

      t.timestamps
    end
  end
end
