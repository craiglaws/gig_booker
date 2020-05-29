require('minitest/autorun')
require('minitest/reporters')
require_relative("../band")
require_relative("../venue")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestGigs < MiniTest::Test
  def setup
    band_options = {"id" => 1, "name" => "The Fratellis", "genre" => "Indie", "bio" => "some text"}


    @band1 = Band.new(band_options)


    venue_options = {"id" => 1, "name" => "Hootenanny", "location" => "Glasgow", "capacity" => 125 }

    @venue1 = Venue.new(venue_options)
  end



  def test_band_name()
    assert_equal("The Fratellis", @band1.name)
  end

  def test_band_genre()
    assert_equal("Indie", @band1.genre)
  end

  def test_band_about()
    assert_equal("some text", @band1.bio)
  end



  def test_venue_name()
    assert_equal("Hootenanny", @venue1.name)
  end

  def test_venue_location()
    assert_equal("Glasgow", @venue1.location)
  end

  def test_venue_capacity()
    assert_equal(125, @venue1.capacity)
  end


end
