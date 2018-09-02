package com.gs.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.SimpleFormatter;

public class DateUtils {
    public static String formatDateStr(String dataStr, String oldFormatter, String newFormatter) {
        Date date = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(oldFormatter);
        try {
            date = simpleDateFormat.parse(dataStr);
            simpleDateFormat = new SimpleDateFormat(newFormatter);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
        return simpleDateFormat.format(date);
    }

    public static String formatDateToStr(Date data, String newFormatter) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(newFormatter);
        return simpleDateFormat.format(data);
    }
}
