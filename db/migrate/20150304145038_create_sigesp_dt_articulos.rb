class CreateSigespDtArticulos < ActiveRecord::Migration
  def change
    create_table :sigesp_dt_articulos do |t|
      t.string :codemp
      t.string :numsol
      t.string :codart
      t.float :canart
      t.string :unidad
      t.float :monpre
      t.float :monart
      t.integer :orden
      t.string :codestpro1
      t.string :codestpro2
      t.string :codestpro3
      t.string :codestpro4
      t.string :codestpro5
      t.string :spg_cuenta
      t.string :estincite
      t.string :numdocdes
      t.float :monpreaux
      t.float :monartaux
      t.string :codalm
      t.string :cod_servicio
      t.string :cod_sede
      t.string :cod_region
      t.string :str_codregionsedeservicio

      t.timestamps
    end
  end
end
