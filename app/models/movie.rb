class Movie < ActiveRecord::Base
   # Option 1: Purely overriding the #as_json method
      def as_json(options={})
        { :name => self.name }  # NOT including the email field
      end

      # Option 2: Working with the default #as_json method
      def as_json(options={})
        super(:only => [:name])
      end
end

