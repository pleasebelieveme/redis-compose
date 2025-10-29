-- 레디스(REmote DIctionary Server)의 철학 Simple is Best
-- 2024년 3월 20일 Redis는 라이센스가 변경되어 완전히 오픈소스라고 하긴 어렵다.

/* Redis의 활용 사례
Redis는 NoSQL 중에서도 Key-Value Store로 작동하는 인메모리 데이터베이스이며, 지연이 적은 읽기 / 쓰기 성능을 가졌습니다.
그렇기 때문에 일시적인 데이터, 변경이 잦은 데이터를 다뤄야 되는 상황에서 많이 활용됩니다.
Session Clustering: 여러 애플리케이션 인스턴스에서 같은 세션 정보를 사용할 수 있도록 도와줍니다.
Caching: 자주 사용되는 데이터를 저장해두어, 데이터베이스 조회를 줄이고 전반적인 응답속도를 개선합니다.
지원하는 다양한 자료구조를 바탕으로 리더보드, 방문수 트래킹, 좌표 기반 검색 등의 기능을 쉽게 구현할 수 있게 해줍니다.
*/

/*
Docker Hub에서 Redis를 찾아보면 세가지 이미지가 나온다
1. redis는 여태까지 가장 많이 사용되어 오던 Redis 서버의 핵심(Core)입니다. 가장 간단한 형태의 연습을 하고 싶다면 redis를 사용합니다.
2. redis/redis-stack-server는 여러 플러그인이 추가된 Redis Stack 서버 이미지입니다. 확률형 데이터, JSON 문서 등을 사용하고 싶다면 선택하게 됩니다.
3. redis/redis-stack는 redis/redis-stack-server에 Redis Insight가 추가된 이미지입니다. Redis Insight를 같이 사용하고 싶다면 선택합니다.
Redis Insight는 Redis에서 제안하는 Redis 전용 IDE입니다.
 */