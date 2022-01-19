load data
 infile '/home/oracle/in/emp.csv'
 into table emp
 fields terminated by ";"
 ( empno, ename, job, mgr, sal, comm, deptno  )
