-- String 자료형
-- <명령어> <key> ~~~
SET user:email alex@example.com
GET user:email

-- 정수가 문자열로 저장된 경우 INCR(++), DECR(--) 가능
-- 조회수에 적용 가능
SET user:count 1
INCR user:count
DECR user:count

-- MSET, MGET 키밸류 한번에 다루기(Multiful)
MSET user:name alex user:email alex@example.com
MGET user:name user:email

-- 문자열 -> toCharArray()
-- 문자열 -> 이미지, 파일, 영, 음성, HTML 모두 해당한다, 최대크기(512MB)

------------------------------------------------------------------
-- List 자료형 -> 정확하게는 Linked List -> 스택, 큐처럼 사용가능(push, pop)
------------------------------------------------------------------
-- Worker Queue(여러 Worker Application에 일을 분배하기 위해)에서 사용가능
-- Timeline(트위터의 타인라인 데이터)에서 사용가능
LPUSH user:list alex
LPUSH user:list brad
RPUSH user:list chad
RPUSH user:list dave

LPOP user:list
RPOP user:list

-- 리스트의 크기
LLEN user:list
-- 뒤의 숫자가 더 크더라도 오류가 나지 않는다
LRANGE user:list 0 30
-- 음수 index
LRANGE user:list 0 -1
LRANGE user:list 0 -2
-- end < start (오류가 발생하지 않는다)
LRANGE user:list 1 0

-- GET은 문자열에서만 사용(Key에 저장된 자료형이 다를경우 오류발생)
-- GET user:list
-- 예외적으로 가능
GET user:null

------------------------------------------------------------------
-- SET 자료형 (중복허용X)
------------------------------------------------------------------
SADD user:java alex
SADD user:java brad
SADD user:java chad
SREM user:java alex

-- Set Is Member(bool리턴)
SISMEMBER user:java alex
-- SMEMBERS 시간복잡도 : O(1)
SMEMBERS user:java
-- Set Cardinality(Set의 갯수)
SCARD user:java

-- 교집합, 합집합
SADD user:python alex
SADD user:python dave
SADD user:java alex

-- Set Intersaction
SINTER user:java user:python
SUNION user:java user:python

-- 교집합의 갯수(먼저 비교하고 싶은 집합의 갯수를 작성)
-- 중복을 허용하지 않는 방문자 세기 -> URL을 키로 만들고 사용자ID를 넣어준다
-- 인증토큰 블랙리스트 구현시 사용
SINTERCARD 2 user:java user:python
SUNIONSTORE 2 user:java user:python

------------------------------------------------------------------
-- Hash 자료형
------------------------------------------------------------------
-- 자바의 Hashcode() -> Field - Value 구조
HSET user:alex name alex age 25
HSET user:alex major CSE
HGET user:alex name
HGET user:alex age
HMGET user:alex age major
HGETALL user:alex

HKEYS user:alex
HLEN user:alex

-- 사용 예: 장바구니, 세션정보
HSET cart:alex computer 1 mouse 2 ketboard 10

-- 하나의 객체를 담는걸 추천 -> HSET users alex brad chad -> X
-- 7.4버전부터 HASH의 복잡한 기능이 추가되었

------------------------------------------------------------------
-- Sorted Set 자료형(정렬된 집합 -> 중복되지 않는 데이터 + 점수)
------------------------------------------------------------------
-- key score value 순서
ZADD user:ranks 10 alex
ZADD user:ranks 9 bard 11 chad 8 dave 9.5 eric

ZINCRBY user:ranks 2 alex
-- 0부터 시작
ZRANK user:ranks alex
ZREVRANK user:ranks alex

ZRANGE user:ranks 0 3
ZREVRANGE user:ranks 0 2

-- 사용예시 순위표(리더보드), Rate Limiter(과도한 요청을 거부하기 위한 기능)


------------------------------------------------------------------
-- 정리
------------------------------------------------------------------
-- 모든 자료형 DEL로 삭제가능
DEL user:list
DEL cart:alex

-- EXPIRE 자료형 종류 상관없음(초로 설정)
SET expirekey "to be expired"
EXPIRE expirekey 5
EXPIRE user:alex 10
-- unix timastamp을 반환
EXPIRETIME expirekey

-- Glob 패턴
KEYS *
KEYS user:*

-- 전체 삭제
FLUSHDB