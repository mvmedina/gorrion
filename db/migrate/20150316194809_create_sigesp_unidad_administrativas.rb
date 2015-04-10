class CreateSigespUnidadAdministrativas < ActiveRecord::Migration
  def change
    create_table :sigesp_unidad_administrativas do |t|
      t.string :codemp
      t.string :coduniadm
      t.string :coduac
      t.string :denuniadm
      t.integer :estemireq
      t.string :codestpro1
      t.string :codestpro2
      t.string :codestpro3
      t.string :codestpro4
      t.string :codestpro5
      t.string :coduniadmsig

      t.timestamps
    end
  end
end
