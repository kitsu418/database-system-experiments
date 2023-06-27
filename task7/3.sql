use finance1;
delimiter $$
create procedure sp_transfer(
    IN applicant_id int,      
    IN source_card_id char(30),
    IN receiver_id int, 
    IN dest_card_id char(30),
    IN amount numeric(10,2),
    OUT return_code int)
pro:
BEGIN
    declare s_id, r_id int;
    declare s_type, r_type char(20);
    declare s_b, rcv_amount numeric(10, 2) default amount;
    select
        b_c_id, b_balance, b_type
    into 
        s_id, s_b, s_type
    from bank_card
    where b_number = source_card_id;
    select
        b_c_id, b_type
    into
        r_id, r_type
    from bank_card
    where b_number = dest_card_id;
    if s_id != applicant_id or r_id != receiver_id  or (s_type = "信用卡" and r_type = "储蓄卡") or (s_type = "储蓄卡" and s_b < amount) then
        set return_code = 0;
        leave pro;
    end if;
    if s_type = "信用卡" then
        set amount = -amount;
    end if;
    if r_type = "信用卡" then
        set rcv_amount = -rcv_amount;
    end if;
    update bank_card set b_balance = b_balance - amount where b_number = source_card_id;
    update bank_card set b_balance = b_balance + rcv_amount where b_number = dest_card_id;
    set return_code = 1;
END$$
delimiter ;