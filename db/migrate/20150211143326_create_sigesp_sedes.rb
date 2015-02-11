class CreateSigespSedes < ActiveRecord::Migration
  def change
    create_table :sigesp_sedes , id:false do |t|
      t.integer :seq_sede
      t.string :str_descripcion
      t.string :str_codsede
      t.integer :int_region
      t.timestamps
    end
  end
end
