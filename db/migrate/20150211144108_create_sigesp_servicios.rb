class CreateSigespServicios < ActiveRecord::Migration
  def change
    create_table :sigesp_servicios , id:false do |t|
      t.integer :seq_servicio
      t.string :str_descripcion
      t.string :str_codservicio
      t.timestamps
    end
  end
end
