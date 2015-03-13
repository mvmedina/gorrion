class CreateSigespSolicitudCargos < ActiveRecord::Migration
  def change
    create_table :sigesp_solicitud_cargos do |t|
      t.string :codemp
      t.string :numsol
      t.string :codcar
      t.string :codestpro1
      t.string :codestpro2
      t.string :codestpro3
      t.string :codestpro4
      t.string :codestpro5
      t.string :spg_cuenta
      t.float :monobjret
      t.float :monret
      t.string :cod_pro
      t.string :ced_bene
      t.string :sc_cuenta
      t.string :formula
      t.float :monto
      t.float :monobjretaux
      t.float :monretaux
      t.float :montoaux
      t.string :codfuefin

      t.timestamps
    end
  end
end
