class CreateInitTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
    end

    create_table :roles do |t|
      t.string :name
    end

    create_table :roles_users do |t|
      t.integer :user_id
      t.integer :role_id
    end

    create_table :policies do |t|
      t.string :number
      t.string :client
      t.integer :commission
      t.integer :collection
      t.integer :user_id
    end

    create_table :products do |t|
      t.string :name
      t.integer :price
    end

    create_table :policies_products do |t|
      t.integer :product_id
      t.integer :policy_id
    end

  end

end
