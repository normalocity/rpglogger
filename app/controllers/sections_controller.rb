class SectionsController < ApplicationController
  def show
    if params[:show_archived]
      @section = Section.find(params[:id], include: [world_objects: [world_object_properties: [:section_property]]])
      @show_deleted_objects = params[:show_archived]
    else
      @section = Section.find(params[:id], include: [world_objects: [world_object_properties: [:section_property]]], conditions: "world_objects.archived_at IS NULL")
    end
    
    authorize! :show, @section.log_book
    @can_manage_world_objects = current_user && current_user.can_manage_world_objects_in?(@section.log_book)
  end
  
  def edit
    @section = Section.find(params[:id])
    authorize! :edit, @section.log_book
    
    if params[:show_archived]
      @show_deleted_properties = params[:show_archived]
      @list_of_properties = @section.section_properties.sort_order
    else
      @list_of_properties = SectionProperty.active.where(["section_id = ?", @section.id]).order("sort_order ASC")
    end
  end
  
  def update
    @section = Section.find(params[:id])
    authorize! :update, @section.log_book
    
    @section.update_attributes(params[:section])
    
    new_section_property_names = params[:section_properties][:new_section_property_names]
    if new_section_property_names.present?
      highest_sort_order = @section.section_properties.collect{|sp| sp.sort_order}.max || 0
      create_new_section_and_world_object_properties_from(new_section_property_names, params[:data_type], highest_sort_order)
    end
    
    redirect_to edit_section_path(@section), notice: "Section updated"
  end
  
  def destroy
    @section = Section.find(params[:id])
    authorize! :destroy, @section.log_book
    
    log_book = @section.log_book
    @section.destroy
    
    redirect_back_or edit_log_book_path(log_book), notice: "Section deleted"
  end
  
  def archive
    @section = Section.find(params[:id])
    authorize! :archive, @section.log_book
    
    @section.update_attribute(:archived_at, Time.now)
    
    redirect_back_or edit_log_book_path(@section.log_book), notice: "Section archived (<a href=\"#{restore_section_path(@section.id)}\" data-method=\"put\">undo</a>)".html_safe
    
  end
  
  def restore
    @section = Section.find(params[:id])
    authorize! :restore, @section.log_book
    
    @section.update_attribute(:archived_at, nil)
    
    redirect_back_or edit_log_book_path(@section.log_book), notice: "Section restored"
  end
  
  private
    def create_new_sections_from(comma_separated_list_of_names)
      new_section_names = comma_separated_list_of_names.split(',').collect{|s| s.strip}.each do |name|
        Section.create(:name=>name, :log_book_id=>@log_book.id) unless name.empty? || name.blank?
      end
    end
    
    def create_new_section_and_world_object_properties_from(comma_separated_list_of_names, data_type, highest_sort_order)
      new_section_names = comma_separated_list_of_names.split(',').collect{|s| s.strip}.each_with_index do |name, index|
        new_section_property = SectionProperty.create(:name=>name, :data_type=>data_type, :sort_order=>highest_sort_order+index+1, :section_id=>@section.id) unless name.empty? || name.blank?
        
        @section.world_objects.each do |obj|
          WorldObjectProperty.create(:section_property=>new_section_property, :world_object=>obj, :boolean_value=>false)
        end
      end
    end
  
end