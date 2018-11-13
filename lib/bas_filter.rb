require 'encrypted'

module Base64Filter
  def base64_encode (input)
    cipher = Encrypted::Ciph.new("256-256")
    key = "feb4e1880f1dd8c00edfa3cbff051599b1274bb89a9c4df8b9dadadcfe1f3c4e" # 256 bits / 8 = 32 bytes
    iv = cipher.generate_iv   # 256 bits / 8 = 32 bytes
    cipher.key = key
    cipher.iv = iv  
    encrypted_text = cipher.encrypt(input)
  end
end

Liquid::Template.register_filter(Base64Filter) # register filter globally
