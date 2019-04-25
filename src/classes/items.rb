class Item
    attr_reader :item_name, :category
    def initialize(item_name, category)
        @item_name = item_name
        @category = category
    end
end