class AddNameAndCoverToPages < ActiveRecord::Migration
  def change
    add_column :pages, :name, :string
    add_column :pages, :cover_source, :string
  end
end
