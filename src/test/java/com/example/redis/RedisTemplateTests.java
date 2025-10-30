package com.example.redis;

import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

@SpringBootTest
public class RedisTemplateTests {

	@Autowired
	private StringRedisTemplate stringRedisTemplate; // String은 자바의 String을 의미함

	@Test
	public void StringOpsTest() {
		// opsForValue: 지금 레디스템플릿에 설정된 타입을 바탕으로 레디스의 문자열을 조작하겠다.
		// ValueOperations가 레디스의 스트링을 다룰 수 있게 해준다
		ValueOperations<String, String> ops = stringRedisTemplate.opsForValue();

		ops.set("simplekey", "simplevalue");
		System.out.println("ops.get(\"simplekey\") = " + ops.get("simplekey"));

		// 집합을 조작하기 위한 클래스
		SetOperations<String, String> setOps = stringRedisTemplate.opsForSet();
		setOps.add("hobbies", "games");
		setOps.add("hobbies", "coding", "alcohol", "games");
		System.out.println("setOps.size(\"hobbies\") = " + setOps.size("hobbies"));

		stringRedisTemplate.expire("hobbies", 10, TimeUnit.SECONDS);
		stringRedisTemplate.delete("simplekey");
	}

	@Autowired
	private RedisTemplate<String, ItemDto> itemRedisTemplate;

	@Test
	public void itemRedisTemplateTest() {
		ValueOperations<String, ItemDto> ops = itemRedisTemplate.opsForValue();
		ops.set("my:keyboard", ItemDto.builder()
			.name("Mechanical Keyboard")
			.price(250000)
			.description("OMG")
			.build());
		System.out.println("ops.get(\"my:keyboard\") = " + ops.get("my:keyboard"));

		ops.set("my:mouse", ItemDto.builder()
			.name("mouse mice")
			.price(100000)
			.description("OMG")
			.build());
		System.out.println("ops.get(\"my:mouse\") = " + ops.get("my:mouse"));
	}
}
