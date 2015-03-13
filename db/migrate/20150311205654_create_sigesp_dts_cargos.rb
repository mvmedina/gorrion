class CreateSigespDtsCargos < ActiveRecord::Migration
  def change
    create_table :sigesp_dts_cargos do |t|
      t.string :codemp
      t.string :numsol
      t.string :codser
      t.string :codcar
      t.float :monbasimp
      t.float :monimp
      t.float :monto
      t.string :formula
      t.float :monbasimpaux
      t.float :monimpaux
      t.float :montoaux

      t.timestamps
    end
  end
end
