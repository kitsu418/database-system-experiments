use finance1;
set global log_bin_trust_function_creators=1;
drop function IF EXISTS get_deposit;

delimiter $$
create function get_deposit(client_id int)
returns numeric(10, 2) 
begin
	return (
        select
            sum(b_balance)
        from bank_card
        where b_type = "储蓄卡"
        group by b_c_id
        having b_c_id = client_id
    );
end$$
delimiter ;

select
    *
from (
    select
        c_id_card,
        c_name,
        get_deposit(c_id) total_deposit
    from client
) a
where total_deposit >= 1000000
order by total_deposit desc;