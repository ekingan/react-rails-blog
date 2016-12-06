class InitialSchema < ActiveRecord::Migration
  def change

  	create_table :posts do |t|
  		t.text :body
  		t.string :location
  		t.timestamps
  	end

  	create_table :comments do |t|
  		t.text :body
  		t.timestamps
  	end

  	create_table :categories do |t|
  		t.string :name
  	end

  	#this adds a column to the comments table of t.integer :post_id
  	add_reference :comments, :post, index: true
  	#adds user_id to comments
  	add_reference :comments, :user, index: true
  	add_reference :posts, :user, index: true
  	add_reference :posts, :category, index: true
  end
end
