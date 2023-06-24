use finance1;
update property
set pro_status = "冻结"
where exists (
        select *
        from client
        where c_phone = "13686431238"
            and c_id = pro_c_id
    );