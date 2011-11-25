require 'spec_helper'

describe WorldObject do
  before(:each) do
    @world_object = Factory.create(:world_object)
    
    for i in 1..20 do
      section_property = Factory.create(:section_property, :section_id=>@world_object.section.id, :name=>"property#{i}", :data_type=>"string", :sort_order=>rand(10000))
      Factory.create(:world_object_property, :section_property_id=>section_property.id, :world_object_id=>@world_object.id, :string_value=>"value#{i}")
    end
  end
  
  it "should have a method called 'sorted_world_object_properties' the returns its WorldObjectProperties in sort_order" do
    sorted_world_object_properties = @world_object.sorted_world_object_properties
    
    last_sort_order = 0
    sorted_world_object_properties.each do |prop|
      prop.sort_order.should >= last_sort_order
      last_sort_order = prop.sort_order
    end
  end
end