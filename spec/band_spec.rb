require('spec_helper')

describe(Band) do
  describe('#venues') do
    it("lists the venues a band has played") do
      test_venue1 = Venue.create({:name => "Roseland"})
      test_venue2 = Venue.create({:name => "Crystal Ballroom"})
      test_band = Band.new({:name => "Jay-Z", :venue_ids => [test_venue1.id(), test_venue2.id()]})
    end
  end

    it("validates presence of a name") do
      band = Band.new({:name => ""})
      expect(band.save()).to(eq(false))
    end

    it("converts the name of the band to capitalized") do
      band = Band.create({:name => "beyonce"})
      expect(band.name()).to(eq("Beyonce"))
      end
    end
