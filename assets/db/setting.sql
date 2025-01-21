create table if not exists setting(
    key text not null
  , value text not null
  , primary key(key)
);
insert or ignore into setting(key, value) values 
  ('paging','page')
, ('fontColor','255,255,255,255')
, ('backgroundColor','255, 24, 24, 24')
, ('offsetBackgroundColor','255, 0, 0, 0')
;