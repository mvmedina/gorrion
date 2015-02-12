class CreateSigespTipoServicios < ActiveRecord::Migration
  def change
    create_table :sigesp_tipo_servicios do |t|
      t.string :codtipser
      t.string :dentipser
      t.string :obstipser
      t.string :codmil

      t.timestamps
    end
  end
end
