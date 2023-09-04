


declare @textstring varchar(max) = 'raj kumar ram kumar suresh kumar ramesh kumar siju';
declare @find varchar(max) = 'kumar';

--find a count of character in a string.

select 
len(@textstring) - 
len(replace(@textstring,'j',''))


-- find a count of a string in another string.
select 
(len(@textstring) - len(replace(@textstring, @find, ''))) / len(@find)



How many times each word in a sentence appeared?
-- create sql challenge 