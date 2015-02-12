class CreateSigespRegions < ActiveRecord::Migration
  def change
    create_table :sigesp_regions , id:false do |t|
      t.integer :seq_region , primary_key: true 
      t.string :str_descripcion
      t.string :str_codregion
    end
  end
end
