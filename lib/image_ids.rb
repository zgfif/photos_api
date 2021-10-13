# frozen_string_literal: true

class ImageIds
  def initialize(response)
    @ids = []
    @response = response
  end

  def extract
    response[:status] == 200 ? extract_ids : ids
  end

  private

  attr_reader :response, :ids

  def extract_ids
    response[:body]['pictures'].each { |pic| ids << pic['id'] }
    ids
  end
end
