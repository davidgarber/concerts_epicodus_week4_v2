class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)

  validates(:name, :presence => true)
  before_save(:capitalize_name)

  define_singleton_method(:find_band) do |name|

    found_band = nil
    Band.all().each() do |band|
      if band.name().==(name)
        found_band = band
      end
    end
    found_band
  end
  
  private

  define_method(:capitalize_name) do
    self.name=self.name.titlecase()
  end
end
