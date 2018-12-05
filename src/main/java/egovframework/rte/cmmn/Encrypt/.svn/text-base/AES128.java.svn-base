package egovframework.rte.cmmn.Encrypt;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;

public class AES128 {
	
	private static String KEY = "jin112_zo12_0rje";
	
	
	/**
     * hex to byte[] : 16진수 문자열을 바이트 배열로 변환한다.
     *
     * @param hex    hex string
     * @return
     */
    public static byte[] hexToByteArray(String hex) {
    	
        if (hex == null || hex.length() == 0) {
            return null;
        }

        byte[] ba = new byte[hex.length() / 2];
        
        for (int i = 0; i < ba.length; i++) {
            ba[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
        }
        
        return ba;
    }

    /**
     * byte[] to hex : unsigned byte(바이트) 배열을 16진수 문자열로 바꾼다.
     *
     * @param ba        byte[]
     * @return
     */
    public static String byteArrayToHex(byte[] ba) {
    	
        if (ba == null || ba.length == 0) {
            return null;
        }

        StringBuffer sb = new StringBuffer(ba.length * 2);
        String hexNumber;
        
        for (int x = 0; x < ba.length; x++) {
            hexNumber = "0" + Integer.toHexString(0xff & ba[x]);
            sb.append(hexNumber.substring(hexNumber.length() - 2));
        }
        
        return sb.toString();
    }


    /**
     * AES 방식의 암호화
     *
     * @param message 암호화 대상 문자열
     * @return String 암호화 된 문자열
     * @throws Exception
     */
    public static String encrypt(String message) throws Exception {

        // use key coss2
        SecretKeySpec skeySpec = new SecretKeySpec(KEY.getBytes(), "AES");

        // Instantiate the cipher
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);

        byte[] encrypted = cipher.doFinal(message.getBytes());
        
        return new String(Base64.encodeBase64(encrypted),"UTF8").replace("+","%2B");
    }
    
    /**
     * AES 방식의 복호화
     *
     * @param message 복호화 대상 문자열
     * @return String 복호화 된 문자열
     * @throws Exception
     */
    public static String decrypt(String encrypted) throws Exception {

        // use key coss2
        SecretKeySpec skeySpec = new SecretKeySpec(KEY.getBytes(), "AES");

        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        
        byte[] original = cipher.doFinal(Base64.decodeBase64(encrypted.replace("%2B","+").getBytes("UTF-8")));
        
        String originalString = new String(original);
        
        return originalString;
    }
	
	/*public static byte[] encrypt(String s) throws Exception {
        //String encrypted = null;
        try {
        	SecretKeySpec skeySpec = new SecretKeySpec(KEY.getBytes(), "AES");
        	Cipher cipher = Cipher.getInstance("AES");
        	cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        	byte[] encrypted = cipher.doFinal(s.getBytes());
        	System.out.println("encrypted string: " + Hex.encodeHexString(encrypted));
        	
            return encrypted;
        } catch (Exception e) {
            throw e;
        }
    }
     
    // key는 16 바이트로 구성 되어야 한다.
    public static String decrypt(String s) throws Exception {

        try {
        	SecretKeySpec skeySpec = new SecretKeySpec(KEY.getBytes(), "AES");
        	Cipher cipher = Cipher.getInstance("AES");

        	// 4. 복호화 수행
        	cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        	byte[] original = cipher.doFinal(s.getBytes());
        	String originalString = new String(original);
        	System.out.println("Original string: " + originalString + " " + Hex.encodeHexString(original));

            return originalString;
        } catch (Exception e) {
            throw e;
        }
    }*/
	
	
	/*// key는 16바이트로 구성 되어야 한다.
    public static String encrypt(String s) throws Exception {
        String encrypted = null;
        try {
            SecretKeySpec skeySpec = new SecretKeySpec(KEY.getBytes(), "AES");
             
            Cipher cipher = Cipher.getInstance("AES");
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
             
            encrypted = new String(Base64.encodeBase64(cipher.doFinal(s.getBytes("UTF-8"))),"UTF8").replace("+","%2B");
            //encrypted = new String(cipher.doFinal(s.getBytes("UTF-8")),"UTF-8");
            return encrypted;
        } catch (Exception e) {
            throw e;
        }
    }
     
    // key는 16 바이트로 구성 되어야 한다.
    public static String decrypt(String s) throws Exception {
        String decrypted = null;
        try {
            SecretKeySpec skeySpec = new SecretKeySpec(KEY.getBytes("UTF-8"), "AES");
             
            Cipher cipher = Cipher.getInstance("AES");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec);
            //decrypted = new String(cipher.doFinal(Base64.decodeBase64(s.replace("%2B","+").getBytes("UTF-8"))));
            decrypted = new String(cipher.doFinal(s.getBytes("UTF-8")),"UTF-8");
            return decrypted;
        } catch (Exception e) {
            throw e;
        }
    }
     
    public static byte[] hexToByteArray(String s) {
        byte[] retValue = null;
        if (s != null && s.length() != 0) {
            retValue = new byte[s.length() / 2];
            for (int i = 0; i < retValue.length; i++) {
                retValue[i] = (byte) Integer.parseInt(s.substring(2 * i, 2 * i + 2), 16);
            }
        }
        return retValue;
    }
     
    public static String byteArrayToHex(byte buf[]) {
        StringBuffer strbuf = new StringBuffer(buf.length * 2);
        for (int i = 0; i < buf.length; i++) {
            if (((int) buf[i] & 0xff) < 0x10) {
                strbuf.append("0");
            }
            strbuf.append(Long.toString((int) buf[i] & 0xff, 16));
        }
         
        return strbuf.toString();
    }*/
}
