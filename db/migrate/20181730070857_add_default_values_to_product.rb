class AddDefaultValuesToProduct < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :name, from: nil, to: 'soap'     
    change_column_default :products, :description, from: nil, to:'yes'   
    change_column_default :products, :part_number, from: nil, to:'TRUE'         
    change_column_default :products, :price, from: nil, to:5.2      
    # change_column_default :products, :test_id, from: nil, to:44   
    revert do
      # add_reference :products, :test, foreign_key: true 
    end
    add_column :products, :test_int , :integer
  end
end
