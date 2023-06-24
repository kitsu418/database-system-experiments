use finance1;
delete from client
where not exists (
        select *
        from bank_card
        where client.c_id = bank_card.b_c_id
    );