module ApplicationHelper
  def avatar_url(user)
		gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
  	"http://gravatar.com/avatar/#{gravatar_id}.png"	
	end

  def render_stars(value)
  	x='★'
    output = ''
    if (1..5).include?(value.to_i)
      value.to_i.times { output += x+' '}
    end
    output
  end

end
