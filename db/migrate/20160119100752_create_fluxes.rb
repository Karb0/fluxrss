class CreateFluxes < ActiveRecord::Migration
  def change
    create_table :fluxes do |t|

      t.string :title
      t.string :url
      t.text :description
      t.boolean :read, default: false
      t.references :user, index: true


      t.timestamps null: false
    end
  end
end
