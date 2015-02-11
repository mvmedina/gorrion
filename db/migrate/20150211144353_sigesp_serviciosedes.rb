class SigespServiciosedes < ActiveRecord::Migration
  def change
    create_table :sigesp_serviciosedes, id:false do |t|
      t.integer :int_servicio
      t.integer :int_sede 
    end
  end
end
