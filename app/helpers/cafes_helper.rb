module CafesHelper

  def current_cafe
    @current_cafe ||= Cafe.find_by(id: cafe_marker[:id])
  end

end
