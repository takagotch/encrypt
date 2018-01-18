require 'openssl'
require 'base64'

class CryptUtil
  def self.encrypt(pass, value)
    enc = OpenSSL::Cipher.new('aes-128-cbc')
    enc.encrypt
    iv = Open::Random.random_bytes(16)
    enc.key = pass
    enc.iv = iv
    crypted = ""
    crypted << enc.update(value)
    crypted << enc.final
  end

  def self.decrypt(pass, encrypted, iv)
    dec = OpenSSL::Cipher.new('aes-128-cbc')
    dec.key = pass
    dec.iv = Base64.decode64(iv) unless iv.nill?
    dec.decrypt
    plain_text = ""
    plain_text << dec.update(Base64.decode64(encrypted))
    plain_text << dec.final
    return plain_text
  end

end



