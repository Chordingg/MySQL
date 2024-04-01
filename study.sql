select * from t_customer;
select * from t_product;
select * from t_region;
select * from t_sales;

-- Q1. 모든 고객의 이름과 이메일을 가져오는 질의
select customer_name, email from t_customer;

-- Q2. 특정 지역 예 서울특별시에 사는 고객의 이름과 전화번호를 가져오는 질의
select customer_name, phone from t_customer where region_code = '02';

-- Q3. 3번 제품의 구매수량과 구매일자를 출력하세요
select qty, sales_date 
from t_sales 
where product_code = 3;

-- Q4. 제품별로 구매된 총 수량과 총 가격을 계산하여 출력하세요
-- 노트북 3 4500000
-- 스마트폰 4 4000000
-- 키보드 9 450000
-- 마우스 5 150000
-- 이어폰 3 210000

select * from t_product;
select * from t_sales;

select p.product_name, sum(s.qty) as 총수량 , sum(s.qty * p.price) as 총가격
from t_sales s 
join t_product p
on s.product_code = p.product_code
group by product_name;


-- Q5. 각 지역별로 고객 수를 계산하여 출력하세요  서울특별시 1)
-- 서울특별시 1
-- 경기도 1
-- left join, right join

select * from t_customer;
select * from t_region;

select*
from t_customer c 
join t_region r 
on c.region_code = r.region_code;	-- 겹쳐있는 모든 값들 출력

select r.region_name as 지역이름, count(c.customer_id) as count
from t_customer c 
join t_region r 
on c.region_code = r.region_code 
group by r.region_name;			-- 0 값은 안나옴 (모든 지역이 출력되지 않았음) [내부 join]

select r.region_name as 지역이름, count(c.customer_id) as count
from t_customer c 
right join t_region r 
on c.region_code = r.region_code
group by r.region_name;			-- 0 값도 나옴 [외부 join]

desc t_customer;


-- Q6. 특정고객(3)이 구매한 제품의 이름을 출력하시오
select * from t_product;
select * from t_sales;

select product_name
from t_product p 
join t_sales s
on p.product_code = s.product_code
where s.customer_id = 3;


-- Q7. 고객이 속한 지역별 총 구매량을 출력하세요
-- 서울특별시 5
-- 경기도 3

select * from t_customer;
select * from t_sales;
select * from t_region;

select*
from t_customer c
join t_sales s
on c.customer_id = s.customer_id;

select c.region_code, sum(s.qty) as count
from t_customer c
join t_sales s
on c.customer_id = s.customer_id
group by c.region_code;

select r.region_name as 지역 , K.count
from t_region r
join (
	select c.region_code, sum(s.qty) as count
	from t_customer c
	join t_sales s
	on c.customer_id = s.customer_id
	group by c.region_code
) K -- 전체 이름을 K라고 지명
on r.region_code = K.region_code;


-- Q8. 제품의 평균 가격보다 높은 가격을 가진 제품의 이름과 가격을 출력하시오

select * from t_product;

select avg(price) from t_product;

select product_name, price
from t_product
where price > (select avg(price) from t_product); 



-- Q9. 고객별 구매한 총 제품 수를 출력하시오

select * from t_customer;
select * from t_product;
select * from t_sales;

select c.customer_name as 고객이름 , count(s.product_code) as 갯수
from t_customer c
join t_sales s
on c.customer_id = s.customer_id
group by c.customer_name;