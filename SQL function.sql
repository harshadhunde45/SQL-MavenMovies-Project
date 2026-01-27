# Non parametric

delimiter $$
create procedure exam ()
begin 
select *from bank_details where marital='single';
end
delimiter $$ ;

call exam()
  
use ineuron_fsda

## parametric procedure user input

delimiter $$
create procedure exam3 (in statuss varchar(20))
begin 
select *from bank_details where marital=statuss;
end;
delimiter $$ ;

call exam3('single')

#criteria age<30 , marital status =single , job=technician

delimiter $$
create procedure exam5(in statuss varchar(20),in agee int,in workk varchar(20))
begin 
select *from bank_details where (marital=statuss and age<agee and job=workk);
end;
delimiter $$ ;

call exam5('single',40,'technician')


