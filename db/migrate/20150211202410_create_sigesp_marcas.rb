class CreateSigespMarcas < ActiveRecord::Migration
  def change
    create_table :sigesp_marcas do |t|
      t.integer :id_marca
      t.string :str_idmarca
      t.string :str_descripcion
      t.boolean :bol_estatus

      t.timestamps
    end
  end
end
