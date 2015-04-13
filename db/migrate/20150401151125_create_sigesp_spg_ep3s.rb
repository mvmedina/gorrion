class CreateSigespSpgEp3s < ActiveRecord::Migration
  def change
    create_table :sigesp_spg_ep3s do |t|
      t.string :codemp
      t.string :codestpro1
      t.string :codestpro2
      t.string :codestpro3
      t.string :denestpro3
      t.string :codfuefin

      t.timestamps
    end
  end
end
