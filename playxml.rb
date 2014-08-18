require 'nokogiri'
require 'open-uri'

class PlaysXml
  def initialize(xml_file)
    @doc = Nokogiri::XML(File.open(xml_file))
    @longest_scene_title=nil
    @longest_scene_line_count=nil
  end

  def get_num_lines
    @doc.xpath("//LINE").count
  end

  def get_num_scenes
    @doc.xpath("//SCENE").count
  end

  def get_longest_scene
    @doc.xpath("//SCENE").each do |scene|
      title=scene.xpath("TITLE").text
      lines_count=scene.xpath("SPEECH/LINE").count
      if !@longest_scene_line_count || (@longest_scene_line_count < lines_count)
        @longest_scene_title=title
        @longest_scene_line_count=lines_count
      end
    end
    "#{@longest_scene_title} is the longest scene with #{@longest_scene_line_count} lines"
  end
end

play_xml_obj=PlaysXml.new("../groupsize.xml")
puts "The xml file has #{play_xml_obj.get_num_lines} lines"
puts "The xml file has #{play_xml_obj.get_num_scenes} scenes"
puts play_xml_obj.get_longest_scene
