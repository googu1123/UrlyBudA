package egovframework.rte.cmmn.Encrypt;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;


public class AES256 {
	// Encrypt Key Length Only 32bytes.
	//private static String key = "tsismobilerndmobilerndpart820112";
	
	public static byte[] ivBytes = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };


	public static String Encrypt(String key, String str)	throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException,	IllegalBlockSizeException, BadPaddingException {
		
		byte[] textBytes 				= str.getBytes("UTF-8");
		AlgorithmParameterSpec ivSpec 	= new IvParameterSpec(ivBytes);
		SecretKeySpec newKey 			= new SecretKeySpec(key.getBytes("UTF-8"), "AES");
		Cipher cipher 					= Cipher.getInstance("AES/CBC/PKCS5Padding");
		
		cipher.init(Cipher.ENCRYPT_MODE, newKey, ivSpec);
		return new String(Base64.encodeBase64(cipher.doFinal(textBytes)), "UTF8").replace("+","%2B");
	}

	public static String Decrypt(String key, String str)	throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		
		byte[] textBytes 				= Base64.decodeBase64(str.replace("%2B","+").getBytes("UTF-8"));		
		//byte[] textBytes 				= str.getBytes("UTF-8");
		AlgorithmParameterSpec ivSpec 	= new IvParameterSpec(ivBytes);
		SecretKeySpec newKey 			= new SecretKeySpec(key.getBytes("UTF-8"), "AES");
		Cipher cipher 					= Cipher.getInstance("AES/CBC/PKCS5Padding");
		
		cipher.init(Cipher.DECRYPT_MODE, newKey, ivSpec);
		return new String(cipher.doFinal(textBytes), "UTF-8");
	}
}