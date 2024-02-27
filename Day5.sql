
-- 계정 생성
create user 'test'@'localhost' identified by '1234';

-- 모든 권한 부여
grant all privileges on *.* to 'test'@'localhost';

-- grant all privileges on *.* to 'test'@'localhost' with grant option;

drop user 'test'@'localhost';