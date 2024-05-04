/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.utils;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author vothimaihoa
 */
public class HashingEncryptor {
    
    //Get encrypted result from byte-based input
    private static byte[] getDigest(byte[] input){
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("SHA-512");
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalArgumentException(e);
        }
        byte[] result = md.digest(input);
        return result;
        
    }
    
    //convert byte array to hexadecimal string
    private static String bytesToHex(byte[] bytes){
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = String.format("%02x", b);
            hexString.append(b);
        }
        return hexString.toString();
    }
    
    //Encrypt a source string
    public static String getEncryptedHexa(String msg){
        byte[] inputBytes = msg.getBytes(StandardCharsets.UTF_8);
        byte[] encryptedBytes = getDigest(inputBytes);
        String encrypted = bytesToHex(encryptedBytes);
        return encrypted;
    }
    
    public static void main(String[] args) {
        System.out.println(getEncryptedHexa("12345"));
    }
}
