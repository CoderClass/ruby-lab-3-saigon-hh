class Product < ActiveRecord::Base
  before_save :set_default_image_path
  validates :name, presence: true

  def discount_amount
    if price_vnd <= 100000
      price_vnd
    elsif price_vnd <= 200000
      round_10k(price_vnd - (price_vnd * 21 / 100))
    elsif price_vnd <= 800000
      round_10k(price_vnd - (price_vnd * 31 / 100))
    else
      round_10k(price_vnd - (price_vnd * 41 /100))
    end
  end

  private

  def round_10k price
    (price / 10000).round * 10000
  end

  def set_default_image_path
    self.image_path ||= "http://lorempixel.com/200/200/fashion"
  end

  def self.alphabetical
    all.order(:name)
  end

end
