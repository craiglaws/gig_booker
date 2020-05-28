require('minitest/autorun')
require('minitest/reporters')
require_relative("../band")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestGigs < MiniTest::Test
  def setup
    options = {"id" => 1, "name" => "The Fratellis", "genre" => "Indie", "about" => "some text"}


    @band1 = Band.new(options)
  end

  def test_band_name()
    assert_equal("The Fratellis", @band1.name)
  end

  def test_band_genre()
    assert_equal("Indie", @band1.genre)
  end

  def test_band_about()
    assert_equal("some text", @band1.about)
  end



end
