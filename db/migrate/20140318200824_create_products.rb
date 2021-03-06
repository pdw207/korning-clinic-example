class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false

      t.timestamps
    end

    Sale.all.each do |sale|
      # create a new Product object
      unless Product.exists?(name: sale.product_name)
        Product.create(name: sale.product_name)
        puts "Product #{sale.product_name} created!"
      else
        puts "Product #{sale.product_name} already existed!"
      end
    end
  end
end
