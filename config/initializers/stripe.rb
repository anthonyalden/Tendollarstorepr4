Rails.configuration.stripe = {
  # :publishable_key => ENV['PUBLISHABLE_KEY'],
  # :secret_key      => ENV['SECRET_KEY']
  # :publishable_key => 'pk_test_6pRNASCoBOKtIshFeQd4XMUh',
  # :secret_key      => 'sk_test_BQokikJOvBiI2HlWgH4olfQ2'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
