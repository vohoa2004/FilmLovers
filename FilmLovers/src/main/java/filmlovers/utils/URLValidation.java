/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author vothimaihoa
 */
public class URLValidation {

    private static final String PATTERN_VIDEO = "http(?:s)?:\\/\\/(?:m.)?(?:www\\.)?youtu(?:\\.be\\/|(?:be-nocookie|be)\\.com\\/(?:watch|[\\w]+\\?(?:feature=[\\w]+.[\\w]+\\&)?v=|v\\/|e\\/|embed\\/|live\\/|shorts\\/|user\\/(?:[\\w#]+\\/)+))([^&#?\\n]+)";
    private static final String PATTERN_IMAGE = "\\bhttps?://[^\\s]+\\.(?:png|jpe?g|gif|bmp)(?:/[^?#\\\\s]*)?\\b";

    public static String convertToEmbedLink(String youtubeLink) {
        String videoId = extractVideoId(youtubeLink);
        if (videoId == null) { // => invalid link
            return null;
        }
        return "https://www.youtube.com/embed/" + videoId;
    }

    public static boolean checkImageLink(String link) {
        Pattern pattern = Pattern.compile(PATTERN_IMAGE);
        Matcher matcher = pattern.matcher(link);
        return matcher.matches();
    }

    public static String extractVideoId(String url) {
        Pattern compiledPattern = Pattern.compile(PATTERN_VIDEO,
                Pattern.CASE_INSENSITIVE);
        Matcher matcher = compiledPattern.matcher(url);
        if (matcher.find()) {
            return matcher.group(1);
        }
        return null;
    }

    public static void main(String[] args) {
        String orgUrl = "https://youtu.be/bLvqoHBptjg?si=fZufHryVa7x3xexb";
        String url = convertToEmbedLink(orgUrl);
        System.out.println(url);

        String img_link = "https://i1.sndcdn.com/artworks-aVuaxTMxiINRIwIg-E7ItOA-t500x500.jpg";
        
        if (checkImageLink(img_link)) {
            System.out.println("OK");
        } else {
            System.out.println("NO OK");
        }
    }

}
