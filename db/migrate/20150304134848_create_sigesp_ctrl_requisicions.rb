class CreateSigespCtrlRequisicions < ActiveRecord::Migration
  def change
    create_table :sigesp_ctrl_requisicions do |t|
      t.string :codemp
      t.string :coduac
      t.string :prefijo
      t.integer :valor
      t.integer :nro_final
      t.integer :maxlen
      t.date :ultfecha

      t.timestamps
    end
  end
end
