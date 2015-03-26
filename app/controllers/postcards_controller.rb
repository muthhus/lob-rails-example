class PostcardsController < ApplicationController

  LOB = Lob.load(api_key: "test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc")

  def index
  end

  def create
    template_file = ERB.new(File.open(File.join(Rails.root, 'app', 'views', 'postcards', 'postcard_front.html.erb')).read)
    custom_html = template_file.result(binding)
    @results = LOB.postcards.create(
      name: "Demo Postcard job",
      to: {
        name: params[:postcards][:to_name],
        address_line1: params[:postcards][:to_address_line1],
        city: params[:postcards][:to_city],
        state: params[:postcards][:to_state],
        zip: params[:postcards][:to_zip],
        country: "US",
      },
      from: {
        name: params[:postcards][:from_name],
        address_line1: params[:postcards][:from_address_line1],
        city: params[:postcards][:from_city],
        state: params[:postcards][:from_state],
        zip: params[:postcards][:from_zip],
        country: "US",
      },
      front: custom_html,
      message: params[:postcards][:message],
      setting: 1001,
      full_bleed: 1
    )
  end

end
