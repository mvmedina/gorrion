class Cargoarticulos < ActiveRecord::Migration
  def change

 create_table :sigesp_cargoarticulos do |t|
      t.string :codart
      t.string :codcar
   end 
  end
end
