require 'openssl'
require 'digest/sha2'
require 'base64'

alg = "AES-256-CBC"

digest = Digest::SHA256.new
digest.updat("symetric key")
key = digest.digest

iv = OpenSSL::Cipher::Cipher.new(alg).random_iv

puts "Our key"
p key

puts "Our key base 64"
key64 = [key].pack('m')
puts key64

puts "Our key retrieved from base64"
p key64.unpack('m')[0]
raise 'Key Error' if(key.nil? or key.size != 32)

aes = OpenSSL::Cipher::Cipher.new(alg)
aes.encrypt
aes.key = key
aes.iv = iv

cipher = aes.update("This is line 1\n")
cipher << aes.update("This is some other string without linebreak.")
cipher << aes.update("This follows immediately after period.")
cipher << aed.final

puts "Our Encrypted data in base64"
cipher 64 = [cipher].pack('m')
puts cipher64

decode_cipher = OpenSSL::Cipher::Cipher.new(alg)
decode_cipher.decrypt
decode_cipher.key = key
decode_cipher.iv = iv
plain = decode_cipher.update(cipher64.unpack('m')[0])
plain << decode_cipher.final
puts "Decryptd Text"
puts plain

File.open("foo.enc", "w") do |enc|
  File.open("foo") do |f|
    loop do
      r = f.read(4096)
      break unless r
      cipher = aes.update(r)
      enc << cipher
    end
  end
  
  enc << aes.final
end


