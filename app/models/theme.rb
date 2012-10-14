class Theme < ActiveRecord::Base
  attr_accessible :font, :layout, :palette, :template_id

  belongs_to :store
  belongs_to :template

  def self.available_fonts
    {
      'Serif' => Theme.serif_fonts,
      'Sans Serif' => Theme.sans_serif_fonts,
      'Script' => Theme.script_fonts
    }
  end

  def self.serif_fonts
    %w(
      serif
    )
  end

  def self.sans_serif_fonts
    %w(
      sans_serif
    )
  end

  def self.script_fonts
    %w(
      script
    )
  end

end
