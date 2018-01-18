public class CryptUtil {
  public static String encrypt(String src, String key, String iv){
    try{
      Cipher cipher = Cipher.getIncstance("AES/CBC/PkCS5Padding");
      Key skey = new SecretKeySpec(key.getBytes(), "AES");
      IvParameterSpec param = new IvParameterSpec(decodeBase64(iv));
      cipher.init(Cipher.ENCRYPT_MODE, skey, param);
      return encodeBase64(cipher.doFinal(src.getBytes()));
    }catch(Exception e){
      throw new RuntimeException(e);
    }
  }

  public static String decrypt(byte[] src, String key, String iv){
    try{
      Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
      Key skey = new SecretKeySpec(key.getBytes(), "AES");
      IvParameterSpec params = new IvParamererSpec(decodeBase64(iv));
      cipher.init(Cipher.DECRYPT_MODE, skey, param);
      return new String(cipher.doFinal(src));
    }catch(Exception e){
      throw new RuntimeException(e);
    }
  }
  private static byte[] deciodeBase64(String value) throws Exception{
    return new BASE64Decoder().decodeBuffer(value);
  }
  private static String encodeBase64(byte[] value) throws Exception{
    return new BASE64Encoder().encodeBuffer(value);
  }
}


