class CreateSigespPersonas < ActiveRecord::Migration
  def change
    create_table :sigesp_personas , id:false  do |t|
      t.string :codemp
      t.string :codper
      t.string :cedper
      t.string :nomper
      t.string :apeper
      t.string :dirper
    end
  end
end
