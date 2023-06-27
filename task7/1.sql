use fib;
drop procedure if exists sp_fibonacci;
delimiter $$
create procedure sp_fibonacci(in m int)
begin
set m = m - 1;
    with recursive cte (id, cur, pre) as (
        select
            0, 0, 0
        union all 
        select 
            id + 1,
            if (id < 2, 1, cur + pre),
            cur 
        from cte 
        where id < m
    ) 
    select 
        id n,
        cur fibn
    from cte;
end $$
delimiter ;