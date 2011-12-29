module Intuit
  class Item < Base
    autoload :AccountRef, "intuit/item/account_ref"

    element "Id",                :as => :id,             :class => Id
    element "ItemParentId",      :as => :parent_id,      :class => Id
    element "ItemParentName",    :as => :parent_name
    element "Name",              :as => :name
    element "Desc",              :as => :description
    element "UnitPrice",         :as => :price,          :class => Money
    element "Type",              :as => :type
    element "IncomeAccountRef",  :as => :income_account, :class => AccountRef
    element "PurchaseCost",      :as => :purchase_cost,  :class => Money
    element "COGSAccountRef",    :as => :cogs_account,   :class => AccountRef
    element "AssetAccountRef",   :as => :asset_account,  :class => AccountRef

    class << self
      def find_by_type(*types)
        all.select { |a| Array.wrap(types).include?(a.type) }
      end

      def find_by_name(name)
        all.select do |item|
          (words(name) - words(item.full_name)).empty?
        end
      end

      private

      def words(name)
        name.split(/[\s\W:]/).map(&:downcase).map(&:strip).reject(&:blank?)
      end
    end

    def full_name
      [parent_name, name].compact.join(":")
    end
  end
end
