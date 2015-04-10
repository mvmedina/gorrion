class CreateSigespSpgEp2s < ActiveRecord::Migration
  def change
    create_table :sigesp_spg_ep2s do |t|
      t.string :codemp
      t.string :codestpro1
      t.string :codestpro2
      t.string :denestpro2

      t.timestamps
    end
  end
end
