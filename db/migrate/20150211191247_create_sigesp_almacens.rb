class CreateSigespAlmacens < ActiveRecord::Migration
  def change
    create_table :sigesp_almacens do |t|
      t.string :codemp
      t.string :codalm
      t.string :nomfisalm
      t.string :desalm
      t.string :telalm
      t.string :ubialm
      t.string :nomresalm
      t.string :telresalm
      t.string :coduniadm

      t.timestamps
    end
  end
end
