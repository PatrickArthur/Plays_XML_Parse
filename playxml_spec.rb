require './playxml.rb'
require 'rspec'

describe "PlaysXml" do
  before do
    @playxml_obj=PlaysXml.new("../groupsize.xml")
  end
  it "get_num_lines should return 2596 lines" do
    expect(@playxml_obj.get_num_lines).to be(2596)
  end
  it "get_num_scenes should return 18 scenes" do
    expect(@playxml_obj.get_num_scenes).to be(18)
  end
  it "get_long_scene should return SCENE I. Rome. BRUTUS's orchard. is the longest scene with 350 lines" do
    expect(@playxml_obj.get_longest_scene).to eq("SCENE I. Rome. BRUTUS's orchard. is the longest scene with 350 lines")
  end
end
