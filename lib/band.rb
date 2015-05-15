class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)

  validates(:name, :presence => true)

  define_singleton_method(:find_venue) do |name|
    before_save(:title_case)

    found_venue = nil
    Venue.all().each() do |venue|
      if venue.name().==(name)
        found_venue = venue
      end
    end
    found_venue
  end

  private

  define_method(:title_case) do
    split_sentence = self.split
    split_sentence.each do |word|
      word.capitalize!()
    end
    split_sentence.join(" ")
  end
end
