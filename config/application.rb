require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Pinteresting
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    
    # required for Heroku
    config.assets.initialize_on_precompile = false
  end
end

CONTINENTS = ['America', 'Asia', 'Africa', 'Europe', 'Australia', 'Antarctica']
AMERICA_COUNTRIES = ['USA']
AFRICA_COUNTRIES = ['Kenya']
ASIA_COUNTRIES = ['China']
ANTARCTICA_COUNTRIES = ['Antarctica']
EUROPE_COUNTRIES = ['France']
AUSTRALIA_COUNTRIES = ['Queensland']
COUNTRIES = AMERICA_COUNTRIES + AFRICA_COUNTRIES + ASIA_COUNTRIES + ANTARCTICA_COUNTRIES + EUROPE_COUNTRIES + AUSTRALIA_COUNTRIES
INTERESTS = ["Entertainment", "Cooking", "Fruit", "Vegetation", "Animals", "Children", "School", "Education", "Arts", "Music", "Opera", "Design", "Festivals", "Roads", "Highways", "Streets", "Museums", "Business", "Dance", "Theatre", "Painting", "Markets", "Nature", "Religious Sites", "Restaurants", "Foods", "Fashion", "Mountains", "Infrastructure", "Life", "Culture", "Outdoor", "Fishing", "Ocean", "Agriculture", "Industry", "People", "Women", "Men"]

require 'will_paginate/array'