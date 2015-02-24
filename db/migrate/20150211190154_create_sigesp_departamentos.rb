class CreateSigespDepartamentos < ActiveRecord::Migration
  def change
    create_table :sigesp_departamentos , id:false  do |t|
      t.string :codemp
      t.string :coddep
      t.string :dendep
      t.string :coddepp
      t.string :nivel
      t.string :codperresponsable
      
    end
  end
end
