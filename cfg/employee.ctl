load data
 infile '/home/oracle/data/employee.txt'
 into table employee
 fields terminated by ","
 ( id, name, dept, salary )
