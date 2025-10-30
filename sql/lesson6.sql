/*
1. 새로운 Spring Boot 프로젝트를 만들어 다음을 진행해보자.
    주문 ID, 판매 물품, 갯수, 총액, 결제 여부에 대한 데이터를 지정하기 위한 ItemOrder 클래스를 RedisHash로 만들고,
    a. 주문 ID - String
    b. 판매 물품 - String
    c. 갯수 - Integer
    d. 총액 - Long
    e. 주문 상태 - String
2. 주문에 대한 CRUD를 진행하는 기능을 만들어보자.
    a. ItemOrder의 속성값들을 ID를 제외하고 클라이언트에서 전달해준다.
    b. 성공하면 저장된 ItemOrder를 사용자에게 응답해준다.
 */

 /*
    새로운 Spring Boot 프로젝트를 만들어 2번 실습의 기능을 실제로 만들어보자.
    실제 Entity 등은 만들지 않고, Redis에 데이터만 저장해보자.
  */

```
-- 레디스의 문자열은 저장된 데이터가 정수라면
-- INCR, DECR 등으로 값을 쉽게 조정할 수 있다.
-- 추가로 존재하지 않는 데이터에 대하 실행할 경우 0으로 초기화된다.
INCR articles:{id}

-- 만약 날짜가 바뀔때 데이터를 저장하고 싶다면,
-- Key를 articles:{id}:today 등으로 만들고
INCR articles:{id}:today

-- 날짜가 바뀌는 시점에 RENAME으로 해당 날짜를 기록하면 된다.
RENAME articles:{id}:today articles:{id}:20XX-XX-XX
```