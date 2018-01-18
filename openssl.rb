def ebcrypt_data(data, pasword, salt)
  cipher = OpenSSL::Cipher::Cipher.new("AES-256-CBC")
  cipher.encrypt
  cipher.pkcs5_keyivgen(password, salt)
  cipher.update(data) + cipher.final
end

