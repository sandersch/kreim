RSpec.describe Kreim do
  it "has a version number" do
    expect(Kreim::VERSION).not_to be nil
  end

  it "passes basic sanity checks about its data" do
    expect(Kreim::Info.index_of("village")).to be < Kreim::Info.index_of("throne")
    boss = Kreim::NPC::BOSS_NAMES.sample
    expect(Kreim::NPC.boss?(boss)).to be_truthy
  end
end
