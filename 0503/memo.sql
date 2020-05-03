CREATE TABLE `memo`.`memo`(  
  `idx` INT(5) NOT NULL AUTO_INCREMENT,
  `name` CHAR(20) NOT NULL,
  `password` CHAR(20) NOT NULL,
  `memo` VARCHAR(2000) NOT NULL,
  `writedate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `ip` CHAR(15),
  PRIMARY KEY (`idx`)
) CHARSET=utf8;

# 데이터 저장
# 테이블 이름만 입력하면 모든 필드에 데이터를 저장하겠다는 의미이다.
# insert into 테이블이름(필드이름) values (저장할데이터);
INSERT INTO memo(NAME, PASSWORD, memo, ip) VALUES ('홍길동', '1111', '1등 입니다.', '192.168.100.101');
INSERT INTO memo(NAME, PASSWORD, memo, ip) VALUES ('임꺽정', '2222', '2등 입니다.', '192.168.100.102');
INSERT INTO memo(NAME, PASSWORD, memo, ip) VALUES ('장길산', '3333', '3등 입니다.', '192.168.100.103');
INSERT INTO memo(NAME, PASSWORD, memo, ip) VALUES ('일지매', '4444', '4등 입니다.', '192.168.100.104');

# 전체 데이터 검색
# "*"은 모든 필드를 의미한다.
# select 필드명 또는 * from 테이블이름;
SELECT * FROM memo;
SELECT NAME, memo FROM memo;

# 조건을 사용한 데이터 검색
# select 필드명 또는 * from 테이블이름 where 조건식;
SELECT * FROM memo WHERE NAME = '홍길동';
# or 조건
SELECT * FROM memo WHERE NAME = '임꺽정' || NAME = '장길산';
SELECT * FROM memo WHERE NAME = '홍길동' OR NAME = '일지매';
# in 연산자 => 괄호 안에 있는 것만
SELECT * FROM memo WHERE NAME = '홍길동' OR NAME = '임꺽정' || NAME = '장길산';
SELECT * FROM memo WHERE NAME IN ('홍길동', '임꺽정', '장길산');
# 괄호 안에 없는 것만 보고 싶다면 in 앞에 not을 붙이면 된다.
SELECT * FROM memo WHERE NAME NOT IN ('홍길동', '임꺽정', '장길산');
# and 조건
SELECT * FROM memo WHERE idx >= 5 && idx <= 10;
SELECT * FROM memo WHERE idx >= 15 AND idx <= 20;
# like 연산자와 와일드 카드 문자를 이용하는 부분 일치 조건
# 와일드 카드(대체) 문자 : % => 여러 문자를 대신한다. _ => 1문자를 대신한다.
# 홍% => 홍으로 시작하는, %홍 => 홍으로 끝나는, %홍% => 홍을 포함하는
SELECT * FROM memo WHERE NAME LIKE '홍%';
SELECT * FROM memo WHERE NAME LIKE '%매';
SELECT * FROM memo WHERE NAME LIKE '%길%';

# limit를 사용해서 특정 범위의 데이터 얻어오기
# select 필드명 또는 * from 테이블이름 limit 시작인덱스, 얻어올개수;
# 인덱스란 select 명령을 실행했을때 출력되는 데이터의 순서로 맨 처음에 출력되는 데이터의 인덱스가 0부터 시작된다.
SELECT * FROM memo WHERE NAME LIKE '%길%' LIMIT 2, 3;

# 데이터를 정렬시켜 얻어오기
# select 필드명 또는 * from 테이블이름 order by 정렬할필드이름 정렬방식;
# 정렬방식 : 오름차순 => asc(생략시 기본값), 내림차순 => desc
SELECT * FROM memo ORDER BY idx DESC;