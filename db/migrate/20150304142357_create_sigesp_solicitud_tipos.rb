class CreateSigespSolicitudTipos < ActiveRecord::Migration
  def change
    create_table :sigesp_solicitud_tipos do |t|
      t.string :codemp
      t.string :numsol
      t.boolean :bol_compra
      t.string :coddepalmacen

      t.timestamps
    end
  end
end
