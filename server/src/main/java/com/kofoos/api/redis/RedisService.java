package com.kofoos.api.redis;

import com.kofoos.api.history.dto.HistoryProductDto;
import com.kofoos.api.product.dto.ProductDetailDto;
import com.mysql.cj.xdevapi.JsonArray;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@Slf4j
@Component
@RequiredArgsConstructor
public class RedisService {
    private final RedisTemplate<String, Object> redisTemplate;

    public void addRecentViewedItem(String deviceId, RedisEntity product) {
        String key = "recentViewed:" + deviceId;
        double score = System.currentTimeMillis();
        redisTemplate.opsForZSet().add(key, product, score);
        //
    }

    public Set<Object> getRecentViewedItems(String deviceId) {
        String key = "recentViewed:" + deviceId;
        return redisTemplate.opsForZSet().reverseRange(key, 0, 9);
    }



    public Map<String, List<HistoryProductDto>> getAllRedisHistories() {
        Map<String, List<HistoryProductDto>> recentItems = new HashMap<>();
        Set<String> keys = redisTemplate.keys("*");
        if (keys != null) {
            keys.forEach(key -> {
                Set<Object> objects = redisTemplate.opsForZSet().reverseRange(key, 0, 9);
                objects.forEach(o -> {
                    LinkedHashMap<?, ?> linkedHashMap = (LinkedHashMap<?, ?>) o;
                    Object barcodeValue = linkedHashMap.get("barcode");
                    Object itemNoValue = linkedHashMap.get("itemNo");
                    Object imgUrlValue = linkedHashMap.get("imgUrl");
                    Object deviceIdValue = linkedHashMap.get("deviceId");
                    Object productIdValue = linkedHashMap.get("productId");
                    Object userIdValue = linkedHashMap.get("userId");
                    Object timeValue = linkedHashMap.get("createdAt");
                    String timeValueString = timeValue.toString();
                    String temp="";
                    for(int i=0;i<timeValueString.length();i++){
                        if(Character.isDigit(timeValueString.charAt(i)) || timeValueString.charAt(i)==','){
                            temp += timeValueString.charAt(i);
                        }
                    }
                    List<Integer> dateTimeValues = Arrays.stream(temp.split(","))
                            .map(Integer::parseInt)
                            .collect(Collectors.toList());

                    int year = dateTimeValues.get(0);
                    int month = dateTimeValues.get(1);
                    int day = dateTimeValues.get(2);
                    int hour = dateTimeValues.get(3);
                    int minute = dateTimeValues.get(4);
                    int second = dateTimeValues.get(5);
                    int nano = dateTimeValues.get(6);
                    LocalDateTime localDateTime = LocalDateTime.of(year, month, day, hour, minute, second, nano);

                    HistoryProductDto productDetailDto = HistoryProductDto.builder()
                            .barcode(barcodeValue.toString())
                            .itemNo(itemNoValue.toString())
                            .productId((Integer) productIdValue)
                            .userId((Integer) userIdValue)
                            .createdAt(localDateTime)
//                            .imgUrl(imgUrlValue.toString())
                            .build();
                    if(recentItems.containsKey(deviceIdValue.toString())){
                        recentItems.get(deviceIdValue.toString()).add(productDetailDto);
                    }
                    else{
                        List<HistoryProductDto> dtoList = new ArrayList<>();
                        dtoList.add(productDetailDto);
                        recentItems.put(deviceIdValue.toString(),dtoList);
                    }
                });
            });
        }
    return recentItems;
}

}