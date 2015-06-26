module CafesHelper

  def current_cafe
    cafe_properties = @cafesjson.select { |cafe_name| cafe_name.even? }
    @current_cafe ||= Cafe.find_by(id: cafe_marker[:id])
  end

end
