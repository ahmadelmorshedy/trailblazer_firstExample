class Item < ActiveRecord::Base
	belongs_to :catalog
	after_save :update_catalog

	protected
	def update_catalog
		catalog = self.catalog
		catalog.total_items = catalog.items.count
		total_cost = 0
		costs = catalog.items.map(&:price)
		costs.each do |item_price|
			total_cost += item_price
		end
		catalog.total_cost = total_cost
		catalog.avg_cost = catalog.total_cost/catalog.total_items
		catalog.save
	end
end
