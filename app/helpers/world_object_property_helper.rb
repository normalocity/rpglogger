module WorldObjectPropertyHelper
  def auto_field_for(form_builder, world_object_property)
    case world_object_property.section_property.data_type
    when 'integer'
      return form_builder.text_field  :integer_value
    when 'image'
      return form_builder.file_field  :image_value
    when 'boolean'
      return form_builder.check_box   :boolean_value
    when 'string'
      return form_builder.text_field  :string_value
    when 'text'
      return form_builder.text_area   :text_value, :class => "span5", :cols => 29, :rows => 8
    end
  end
end
