/*
내 블로그 글 별 조회수를 Redis로 확인하고 싶다.
1. 블로그 URL의 PATH는 /articles/{id} 형식이다.
2. 로그인 여부와 상관없이 새로고침 될때마다 조회수가 하나 증가한다.
3. 이를 관리하기 위해 적당한 데이터 타입을 선정하고,
4. 사용자가 임의의 페이지에 접속할 때 실행될 명령을 작성해보자.
 */

 -- String - INCR(++), DNCR(--)
-- INCR articles/{id}
INCR articles:1
INCR articles:2

-- 오늘의 조회수를 따로 관리하고 싶다면?
INCR articles:1:today
RENAME articles:1:today articles:20XX-XX-XX


/*
블로그에 로그인한 사람들의 조회수와 가장 많은 조회수를 기록한 글을 Redis로 확인하고 싶다.
1. 블로그 URL의 PATH는 /articles/{id} 형식이다.
2. 로그인 한 사람들의 계정은 영문으로만 이뤄져 있다.
3. 이를 관리하기 위해 적당한 데이터 타입을 선정하고,
4. 사용자가 임의의 페이지에 접속할 때 실행될 명령을 작성해보자.
5. 만약 상황에 따라 다른 명령이 실행되어야 한다면, 주석으로 추가해보자.
*/

-- 중복을 허용하지 않게 Set
SADD articles:1 alex
SADD articles:1 blad
SADD articles:1 chad
SCARD articles:1

SADD articles:2 alex
SADD articles:2 blad
SCARD articles:2

-- SADD의 결과에 따라 명령어를 실행하거나 안하거나(실제 데이터가 들어간 갯수를 반환)
-- 0은 skip
-- 1일 경우? Sorted Set에 넣어주기
ZADD articles:ranks 1 articles:1
ZINCRBY articles:ranks 1 articles:1
ZINCRBY articles:ranks 1 articles:2

ZRANGE articles:ranks 0 -1

-- 가장 높은 조회수 1순위의 값 조회
ZREVRANGE articles:ranks 0 0
ZRANGE articles:ranks 0 0 REV