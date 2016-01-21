class DeleteReadOnFlux < ActiveRecord::Migration
  def change
    remove_column :fluxes, :read
  end
end
