class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)

  validates(:name, :presence => true)
  before_save(:capitalize_name)


  define_singleton_method(:find_venue) do |name|

    found_venue = nil
    Venue.all().each() do |venue|
      if venue.name().==(name)
        found_venue = venue
      end
    end
    found_venue
  end

  private

  define_method(:capitalize_name) do
      self.name=(name().capitalize())
    end
end
