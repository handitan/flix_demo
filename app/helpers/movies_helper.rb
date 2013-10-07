module MoviesHelper
  
  def format_total_gross(movie) 
    if movie.flop?
      content_tag(:strong, "Flop!")
      #"<strong>Flop!</strong>".html_safe
    else
      number_to_currency(movie.total_gross)
    end  
  end

  def image_for(movie)
    if movie.image_file_name.blank?
      image_tag 'placeholder.png'
    else
      image_tag movie.image_file_name
    end
  end

  def format_average_stars(movie)
      if movie.average_stars.blank?
        content_tag(:strong, "No reviews")
      else
        pluralize(number_with_precision(movie.average_stars, precision: 1),"star")
      end
  end

  def format_recent_reviews(movie)
    if movie.recent_reviews_exist?
        concat(content_tag(:h3,"Most recent reviews"))
        content_tag :div do
          movie.recent_reviews.each do |mr| 
            concat "\"#{mr.comment}\""
            concat " by #{mr.name}"
            concat(content_tag(:br))
          end
        end
    end
  end
end
