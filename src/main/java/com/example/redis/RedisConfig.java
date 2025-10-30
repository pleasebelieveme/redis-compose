package com.example.redis;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericToStringSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;

@Configuration
public class RedisConfig {
	//RedisConnectionFactory는 application.yml파일을 참고해서 생
	@Bean
	public RedisTemplate<String, ItemDto> itemRedisTemplate(RedisConnectionFactory redisConnectionFactory) {
		RedisTemplate<String, ItemDto> template = new RedisTemplate<>();
		template.setConnectionFactory(redisConnectionFactory);
		template.setKeySerializer(RedisSerializer.string());
		template.setValueSerializer(RedisSerializer.json());
		return template;
	}

	// lesson 1-6 풀이풀이
	@Bean
	public RedisTemplate<String, Integer> articleTemplate(RedisConnectionFactory redisConnectionFactory) {
		RedisTemplate<String, Integer> template = new RedisTemplate<>();
		template.setConnectionFactory(redisConnectionFactory);
		template.setKeySerializer(RedisSerializer.string());
		template.setValueSerializer(new GenericToStringSerializer<>(Integer.class)); // 값이 무조건 정수일 때 사용
		return template;
	}
}
