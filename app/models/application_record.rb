class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'l_e_others_500.png')), filename: 'l_e_others_500.png', content_type: 'image/png')
    end
  end

  def default_images
    if !self.images.attached?
      self.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'l_e_others_500.png')), filename: 'l_e_others_500.png', content_type: 'image/png')
    end
  end

end
