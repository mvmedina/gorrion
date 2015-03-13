class CreateSigespCuentaGastos < ActiveRecord::Migration
  def change
    create_table :sigesp_cuenta_gastos do |t|
      t.string :codemp
      t.string :numsol
      t.string :codestpro1
      t.string :codestpro2
      t.string :codestpro3
      t.string :codestpro4
      t.string :codestpro5
      t.string :spg_cuenta
      t.float :monto
      t.float :montoaux
      t.string :codfuefin
      t.string :cod_servicio
      t.string :cod_sede
      t.string :cod_region
      t.string :str_codregionsedeservicio

      t.timestamps
    end
  end
end
