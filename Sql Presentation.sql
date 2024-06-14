create database bankanalytics;
use bankanalytics;
show tables;
select * from finance_1;
select * from finance_2;
select * from finance_1 inner join finance_2;

#kp1.  --year wise loan amount states---
select year as year_of_issue_d,sum(loan_amnt) as total_loan_amnt from finance_1
group by year_of_issue_d
order by year_of_issue_d;
 
 #kpi-2 ---grade and sub_grade wise revol_bal---
 select
 grade, sub_grade, sum(revol_bal) as total_revol_bal
 from finance_1 inner join finance_2
 on (finance_1.id = finance_2.id)
 group by grade , sub_grade
 order by grade;
 
  #kpi3.  ---Total payment for Verified status Vs Total for Non verified status---
 select verification_status,sum(total_pymnt) as Total_Payment
 from finance_1 inner join finance_2
 on (finance_1.id = finance_2.id)
 where verification_status in  ('Verified','Not Verified')
 group by verification_status;
  
 #kpi4. ---state wise and last_credit_pull_d wise loan status---
 select addr_state,last_credit_pull_d,loan_status
  from finance_1 inner join finance_2
   on (finance_1.id = finance_2.id)
   group by addr_state,last_credit_pull_d,loan_status
   order by loan_status;
   
   #kpi5  ---home ownership Vs last payment date stats--- 
select home_ownership ,last_pymnt_d
 from finance_1 inner join finance_2
   on (finance_1.id = finance_2.id)
   group by home_ownership,last_pymnt_d
   order by home_ownership,last_pymnt_d;


 


 
 
 
 
 


