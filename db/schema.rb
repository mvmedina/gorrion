# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150211144353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administracion_controladors", force: true do |t|
    t.string   "subject_class"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administracion_permiso_usuarios", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "permiso_id"
    t.boolean  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administracion_permisos", force: true do |t|
    t.string   "nombre"
    t.integer  "controlador_id"
    t.string   "accion"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administracion_usuarios", force: true do |t|
    t.string   "username",               limit: 15
    t.string   "cedula",                 limit: 10
    t.string   "nombres",                limit: 40
    t.string   "string",                 limit: 250
    t.string   "apellidos",              limit: 40
    t.string   "celular",                limit: 15
    t.string   "telefono",               limit: 15
    t.string   "direccion",              limit: 250
    t.boolean  "estado",                             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                              default: "",   null: false
    t.string   "encrypted_password",                 default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "administracion_usuarios", ["email"], name: "index_administracion_usuarios_on_email", unique: true, using: :btree
  add_index "administracion_usuarios", ["reset_password_token"], name: "index_administracion_usuarios_on_reset_password_token", unique: true, using: :btree

  create_table "personas", force: true do |t|
    t.string   "codemp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_regions", id: false, force: true do |t|
    t.integer  "seq_region"
    t.string   "str_descripcion"
    t.string   "str_codregion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_sedes", id: false, force: true do |t|
    t.integer  "seq_sede"
    t.string   "str_descripcion"
    t.string   "str_codsede"
    t.integer  "int_region"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_servicios", id: false, force: true do |t|
    t.integer  "seq_servicio"
    t.string   "str_descripcion"
    t.string   "str_codservicio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigesp_serviciosedes", id: false, force: true do |t|
    t.integer "int_servicio"
    t.integer "int_sede"
  end

end
