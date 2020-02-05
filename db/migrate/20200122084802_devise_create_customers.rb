# frozen_string_literal: true

class DeviseCreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      ## Database authenticatable
      t.boolean :is_enabled,        default: true, null: false
      # ↑会員ステータスカラム TRUE =有効　FALSE =退会済
      t.string :last_name,          null: false, default: ""
      t.string :first_name,         null: false, default: ""
      t.string :last_name_kana,     null: false, default: ""
      t.string :first_name_kana,    null: false, default: ""
      t.string :phone_number,       null: false, default: ""
      t.string :email,              null: false, default: "", unique: true
      t.string :encrypted_password, null: false, default: ""
      t.string :post_code,          null: false, default: ""
      t.text   :address,            null: false, default: ""
      

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :customers, :email,                unique: true
    add_index :customers, :reset_password_token, unique: true
    # add_index :customers, :confirmation_token,   unique: true
    # add_index :customers, :unlock_token,         unique: true
  end
end
