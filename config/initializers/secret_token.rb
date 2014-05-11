# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Blocitoff::Application.config.secret_token = ENV['SECRET_TOKEN'] || 'fba58ce60af3fe09657af87defa0ccaafc1ef984df8fb61145cef22d221b03d02b8ecc88b1d344b63c42525bff437eff71c147c9e19c3258a391d10203050872'
