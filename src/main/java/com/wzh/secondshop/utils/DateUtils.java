package com.wzh.secondshop.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DateUtils {

    private static final String DEFAULT_PATTERN = "yyyy-MM-dd HH:mm:ss";
    private static final SimpleDateFormat sdf = new SimpleDateFormat(DEFAULT_PATTERN);

    /**
     * 将 Date、Timestamp、LocalDateTime 转换为格式化字符串
     * @param dateObj 需要转换的日期对象（Date、Timestamp、LocalDateTime）
     * @return 格式化后的字符串（yyyy-MM-dd HH:mm:ss），如果对象为空则返回空字符串
     */
    public static String formatDate(Object dateObj) {
        if (dateObj == null) {
            return "";
        }

        if (dateObj instanceof Date) {
            return sdf.format((Date) dateObj);
        }

        if (dateObj instanceof Timestamp) {
            return sdf.format((Timestamp) dateObj);
        }

        if (dateObj instanceof LocalDateTime) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DEFAULT_PATTERN);
            return ((LocalDateTime) dateObj).format(formatter);
        }

        throw new IllegalArgumentException("Unsupported date type: " + dateObj.getClass().getName());
    }

    /**
     * 将字符串转换为 java.util.Date
     * @param dateStr 日期字符串（格式：yyyy-MM-dd HH:mm:ss）
     * @return Date 对象，如果解析失败返回 null
     */
    public static Date parseStringToDate(String dateStr) {
        if (dateStr == null || dateStr.isEmpty()) {
            return null;
        }
        try {
            return sdf.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
