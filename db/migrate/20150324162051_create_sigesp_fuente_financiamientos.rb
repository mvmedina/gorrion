class CreateSigespFuenteFinanciamientos < ActiveRecord::Migration
  def change
    create_table :sigesp_fuente_financiamientos do |t|
      t.string :codemp
      t.string :codfuefin
      t.string :denfuefin
      t.string :expfuefin

      t.timestamps
    end
  end
end
