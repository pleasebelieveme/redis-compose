package com.example.redis.repository;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
// Entity대신 RedisHash
@RedisHash("item")
public class Item implements Serializable {

	@Id
	// Id를 String으로 설정하면 UUID가 자동으로 배정된다.
	private String id;
	private String name;
	private String description;
	private Integer price;
}
