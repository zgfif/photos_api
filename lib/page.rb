# frozen_string_literal:true

# it generates page responses
class Page
  def initialize(image_params)
    @image_params = image_params
  end

  def process
     if valid_number_of_page?
        Rails.cache.read("#{url}?page=#{page_number}")
     elsif page_number == 0
        Rails.cache.read(url)
     else
       invalid_page(page_number)
     end
  end

  private

  attr_reader :image_params

  def valid_number_of_page?
    (1..26).include?(page_number)
  end

  def url
    Rails.application.credentials.agile_url + 'images'
  end

  def page_number
    image_params[:page].to_i
  end

  def invalid_page(n)
    { body: { pictures: [], page: n.to_s, pageCount: 26, hasMore: false },
      status: 200 
    }
  end
end
