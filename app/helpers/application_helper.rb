module ApplicationHelper

  def fu_robots(email)
    email =~ (/(.+)[@]/)
    $1
  end
end
