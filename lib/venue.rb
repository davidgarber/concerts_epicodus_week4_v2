class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)

  define_singleton_method(:find_venue) do |name|

    found_venue = nil
    Venue.all().each() do |venue|
      if venue.name().==(name)
        found_venue = venue
      end
    end
    found_venue
  end
end
