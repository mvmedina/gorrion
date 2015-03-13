class CreateSigespDtCargos < ActiveRecord::Migration
  def change
    create_table :sigesp_dt_cargos do |t|
      t.string :codemp
      t.string :numsol
      t.string :codart
      t.string :codcar
      t.float :monbasimp
      t.float :monimp
      t.float :monto
      t.string :formula
      t.float :monbasimpaux
      t.float :monimpaux
      t.float :montoaux
      t.string :cod_servicio
      t.string :cod_sede
      t.string :cod_region
      t.string :str_codregionsedeservicio

      t.timestamps
    end
  end
end
