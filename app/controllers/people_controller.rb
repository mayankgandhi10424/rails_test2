class PeopleController < ApplicationController
  layout 'max'
  def new
    @person = Person.new(city_id: 3)
  end

  def upload
    uploaded_io = params[:person][:picture]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  def show 
    print "name:", Person.find_by(name: params[:id])
  end
end

class LabellingFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options={})
    label(attribute) + super
  end
end
