package egovframework.rte.cmmn.Encrypt;

import java.security.Key;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.DESedeKeySpec;

import org.apache.commons.codec.binary.Base64;

public class TripleDES {
	final static private String KEY_VALUE = "jin112_zo12_0rjek3_2jala";
	
	public TripleDES() { }
   
	/**
     * 고정키 정보
     * @return
     */
	public static String key() 
	{
		return KEY_VALUE;
	}
   
	/**
     * 키값
     * 24바이트인 경우 TripleDES 아니면 DES
     * @return
     * @throws Exception
     */
	public static Key getKey() throws Exception {
		return (key().length() == 24) ? getKey2(key()) : getKey1(key());
	}
	
	/**
     * 지정된 비밀키를 가지고 오는 메서드 (DES)
     * require Key Size : 16 bytes
     *
     * @return Key 비밀키 클래스
     * @exception Exception
     */
    public static Key getKey1(String keyValue) throws Exception {
        DESKeySpec desKeySpec = new DESKeySpec(keyValue.getBytes());
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        Key key = keyFactory.generateSecret(desKeySpec);
        return key;
    }
    
    /**
     * 지정된 비밀키를 가지고 오는 메서드 (TripleDES)
     * require Key Size : 24 bytes
     * @return
     * @throws Exception
     */
    public static Key getKey2(String keyValue) throws Exception {
        DESedeKeySpec desKeySpec = new DESedeKeySpec(keyValue.getBytes());
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DESede");
        Key key = keyFactory.generateSecret(desKeySpec);
        return key;
    }

    /**
     * 문자열 대칭 암호화
     *
     * @param ID
     *            비밀키 암호화를 희망하는 문자열
     * @return String 암호화된 ID
     * @exception Exception
     */
    public static String Encrypt(String ID) throws Exception {
        if(ID == null || ID.length() == 0)	return "";
        
        String instance = (key().length() == 24) ? "DESede/ECB/PKCS5Padding" : "DES/ECB/PKCS5Padding";
        javax.crypto.Cipher cipher = javax.crypto.Cipher.getInstance(instance);
        cipher.init(javax.crypto.Cipher.ENCRYPT_MODE, getKey());
        
        byte[] inputBytes1 = ID.getBytes("UTF8");
        byte[] outputBytes1 = cipher.doFinal(inputBytes1);
        return new String(Base64.encodeBase64(outputBytes1), "UTF8").replace("+","%2B");
    }

    /**
     * 문자열 대칭 복호화
     *
     * @param codedID
     *            비밀키 복호화를 희망하는 문자열
     * @return String 복호화된 ID
     * @exception Exception
     */
    public static String Decrypt(String codedID) throws Exception {
        if (codedID == null || codedID.length() == 0)
            return "";
        
        String instance = (key().length() == 24) ? "DESede/ECB/PKCS5Padding" : "DES/ECB/PKCS5Padding";
        javax.crypto.Cipher cipher = javax.crypto.Cipher.getInstance(instance);
        cipher.init(javax.crypto.Cipher.DECRYPT_MODE, getKey());

        byte[] inputBytes1 = Base64.decodeBase64(codedID.replace("%2B","+").getBytes("UTF-8"));
        byte[] outputBytes2 = cipher.doFinal(inputBytes1);

        String strResult = new String(outputBytes2, "UTF8");
        return strResult;
    }
}
