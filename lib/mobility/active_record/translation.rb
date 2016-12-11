module Mobility
  module  ActiveRecord
    class Translation < ::ActiveRecord::Base
      self.table_name = "mobility_translations"
      belongs_to :translatable, polymorphic: true

      validates :value, presence: true
      validates :key, presence: true, uniqueness: { scope: [:translatable_id, :translatable_type, :locale] }
      validates :translatable, presence: true
      validates :locale, presence: true

      def __mobility_get
        value
      end

      def __mobility_set(value)
        self.value = value
      end
    end
  end
end