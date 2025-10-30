package com.example.redis;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class RedisRepositoryTests  {

	@Autowired
	private ItemRepository itemRepository;

	@Test
	public void createTest() {
		// 객체를 만들고
		Item item = Item.builder()
			// .id(1L) // 하드코딩이 없으면 Hash값으로 생성
			.name("keyboard")
			.description("Very Expensive Keyboard")
			.price(100000)
			.build();
		// save()를 호출
		itemRepository.save(item);
	}

	@Test
	public void readOneTest() {
		Item item = itemRepository.findById("").orElseThrow();
		System.out.println("item.getDescription() = " + item.getDescription());
	}

	@Test
	public void updateTest() {
		Item item = itemRepository.findById("").orElseThrow();
		item.setDescription("On Sale!!!");
		item = itemRepository.save(item);
		System.out.println("item.getDescription() = " + item.getDescription());
	}

	@Test
	public void deleteTest() {
		itemRepository.deleteById("");
	}
}
