class AddPubdateToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :pub_date, :date
  end
end
