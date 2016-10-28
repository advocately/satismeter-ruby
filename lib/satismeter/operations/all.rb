module Satismeter
  module Operations
    module All
      def self.included(klass)
        klass.extend(ClassMethods)
      end

      module ClassMethods
        def all(opts = {}, client = Satismeter.shared_client)
          opts = Utils.serialize_values(opts)
          json = client.get_json(path, opts)

          EnumerableResourceCollection.new(json[record_key].map { |attributes| new(attributes) })
        end
      end
    end
  end
end
