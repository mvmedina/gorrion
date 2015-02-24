class CreateSigespArticulos < ActiveRecord::Migration
  def change
    create_table :sigesp_articulos do |t|
      t.string :codemp
      t.string :codart
      t.string :denart
      t.string :codtipart
      t.string :codunimed
      t.date :feccreart
      t.string :obsart
      t.float :exiart
      t.float :exiiniart
      t.float :minart
      t.float :maxart
      t.float :reoart
      t.float :prearta
      t.float :preartb
      t.float :preartc
      t.float :preartd
      t.date :fecvenart
      t.string :codcatsig
      t.string :spg_cuenta
      t.string :sc_cuenta
      t.float :pesart
      t.float :altart
      t.float :ancart
      t.float :proart
      t.float :ultcosart
      t.float :cosproart
      t.string :fotart
      t.float :preartaaux
      t.float :preartbaux
      t.float :preartcaux
      t.float :preartdaux
      t.string :ultcosartaux
      t.string :float
      t.float :cosproartaux
      t.string :serart
      t.string :ubiart
      t.string :docart
      t.string :fabart
      t.string :codmil
      t.string :str_codact
      t.string :unimeddetal
      t.float :preartdetal
      t.boolean :bol_estart

      t.timestamps
    end
  end
end
