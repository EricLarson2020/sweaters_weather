require 'securerandom'

class NumberGenerator

  def api_key_generator
    SecureRandom.hex
  end

end
