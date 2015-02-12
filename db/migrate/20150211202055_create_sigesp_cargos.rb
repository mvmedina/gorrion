class CreateSigespCargos < ActiveRecord::Migration
  def change
    create_table :sigesp_cargos do |t|
      t.string :codemp
      t.string :codcar
      t.string :dencar
      t.string :codestpro
      t.string :spg_cuenta
      t.double :procar
      t.integer :estlibcom
      t.string :formula

      t.timestamps
    end
  end
end
