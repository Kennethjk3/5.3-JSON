require 'test_helper'

class AthleteTest < ActiveSupport::TestCase

  def setup
    @athlete1 = athletes(:one)
    @athlete2 = athletes(:two)
  end

  test "athlete1 is valid" do
    assert @athlete1.valid?
  end
  #
  test "athlete2 is valid" do
    assert @athlete2.valid?
  end
  #
  # test "sport has value" do
  # end
  #
  # test "" do
  # end
  #
  # test "" do
  # end
  #
  # test "" do
  # end
  #
  # test "" do
  # end
  #
  # test "" do
  # end
  #
  # test "" do
  # end
  #
  # test "" do
  # end
  #
  # test "" do
  # end
  #
  # test "" do
  # end

end
