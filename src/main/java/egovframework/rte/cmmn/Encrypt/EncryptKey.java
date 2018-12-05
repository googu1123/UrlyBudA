package egovframework.rte.cmmn.Encrypt;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


/**
* @Class Name : Encrypt.java
* @Description 문자열 암호화 모듈(MD5)
* @author Choi jinho
* @since 2011. 07. 20
*/

public class EncryptKey {
	public static String encrypt(String str) throws NoSuchAlgorithmException {
		String encData = "";
        
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytes = str.getBytes();
			md.update(bytes);
			byte[] digest = md.digest();

			for(int i=0; i<digest.length; i++ ) {
				encData += Integer.toHexString(digest[i]&0xff);
			}

		} catch (NoSuchAlgorithmException e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}

		return encData; 
	}

}

