class CreateSigespModelos < ActiveRecord::Migration
  def change
    create_table :sigesp_modelos do |t|
      t.integer :id_modelo
      t.string :str_idmarca
      t.string :str_idmodelo
      t.string :str_descripcion

      
    end
  end
end
