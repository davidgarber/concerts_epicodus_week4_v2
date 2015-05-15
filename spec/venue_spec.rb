require('spec_helper')

describe(Venue) do
  describe('#bands') do
    it("lists bands a venue has hosted") do
      test_band1 = Band.create({:name => "Jay-Z"})
      test_band2 = Band.create({:name => "Beyonce"})
      test_venue = Venue.new({:name => "Roseland", :band_ids => [test_band1.id(), test_band2.id()]})
    end
  end

    it("validates presence of a name") do
      band = Band.new({:name => ""})
      expect(band.save()).to(eq(false))
    end

    it("converts the name of the venue to capitalized") do
      venue = Venue.create({:name => "roseland"})
      expect(venue.name()).to(eq("Roseland"))
    end
  end
