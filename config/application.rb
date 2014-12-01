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

CONTINENTS = ['North America', 'South America','Asia', 'Africa', 'Europe', 'Australia']
NORTH_AMERICA_COUNTRIES = ['Antigua & Barbuda', 'Bahamas', 'Barbados', 'Belize', 'Canada', 'Costa Rica', 'Cuba', 'Dominica', 'Dominican Republic','El Salvador', 'Grenada', 'Guatemala', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 'Nicaragua', 'Panama', 'St. Kitts & Nevis', 'St. Lucia', 'St. Vincent & The Grenadines', 'Trinidad & Tobago', 'United States of America']
SOUTH_AMERICA_COUNTRIES = ['Argentina', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Guyana', 'Paraguay', 'Peru', 'Suriname', 'Uruguay', 'Venezuela']
AFRICA_COUNTRIES = ['Algeria', 'Angola', 'Benin', 'Botswana', 'Burkina Faso', 'Burundi', 'Cameroon', 'Cape Verde', 'Central African Republic','Chad','Comoros','Congo','Congo Democratic Republic of',"Cote d'Ivoire", 'Djibouti','Egypt','Equatorial Guinea','Eritrea','Ethiopia','Gabon','Gambia','Ghana','Guinea','Guinea-Bissau','Kenya','Lesotho', 'Liberia', 'Libya','Madagascar', 'Malawi','Mali','Mauritania', 'Mauritius','Morocco','Mozambique','Namibia','Niger','Nigeria','Rwanda','Sao Tome & Principe','Senegal','Seychelles','Sierra Leone','Somalia','South Africa','South Sudan','Sudan','Swaziland','Tanzania','Togo','Tunisia','Uganda','Zambia','Zimbabwe']
ASIA_COUNTRIES = ['Afghanistan','Bahrain','Bangladesh','Bhutan','Brunei','Cambodia','China','East Timor','India','Indonesia','Iran','Iraq','Israel','Japan','Jordan','Kazakhstan','Korea North','Korea South','Kuwait','Kyrgyzstan','Laos','Lebanon','Malaysia','Maldives','Mongolia','Myanmar (Burma)','Nepal','Oman','Pakistan','The Philippines','Qatar', 'Russia', 'Saudi Arabia', 'Singapore', 'Sri Lanka', 'Syria', 'Taiwan', 'Tajikistan', 'Thailand', 'Turkey', 'Turkmenistan', 'United Arab Emirates', 'Uzbekistan', 'Vietnam', 'Yemen']
EUROPE_COUNTRIES = ['Albania', 'Andorra', 'Armenia', 'Austria', 'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia & Herzegovina', 'Bulgaria', 'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland', 'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland', 'Italy', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro', 'The Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia', 'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City (Holy See)']
AUSTRALIA_COUNTRIES = ['Australia']
COUNTRIES = NORTH_AMERICA_COUNTRIES + SOUTH_AMERICA_COUNTRIES + AFRICA_COUNTRIES + ASIA_COUNTRIES + EUROPE_COUNTRIES + AUSTRALIA_COUNTRIES
INTERESTS = ["Entertainment", "Cooking", "Fruit", "Vegetation", "Animals", "Children", "School", "Education", "Arts", "Music", "Opera", "Design", "Festivals", "Roads", "Highways", "Streets", "Museums", "Business", "Dance", "Theatre", "Painting", "Markets", "Nature", "Religious Sites", "Restaurants", "Foods", "Fashion", "Mountains", "Infrastructure", "Life", "Culture", "Outdoor", "Fishing", "Ocean", "Agriculture", "Industry", "People", "Women", "Men"]

require 'will_paginate/array'