use finance1;
update property,
    client
set property.pro_id_card = client.c_id_card
where property.pro_c_id = client.c_id;