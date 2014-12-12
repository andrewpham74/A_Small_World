Rails.configuration.stripe = {
  :publishable_key => 'pk_test_OaABfyKVhXUegbXWRIvXGEyb',
  :secret_key      => 'sk_test_hSIhPEQwAdIUHI6w1q1J0ej0'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]